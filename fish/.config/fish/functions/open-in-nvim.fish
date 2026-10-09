# Open `file[:line[:col]]` in nvim, for use as LAUNCH_EDITOR (e.g. by `my-bad`).
#
# - tmux client attached, focused window has an nvim pane:
#       send the file to the first nvim found there and focus its pane
# - tmux client attached, no nvim in the focused window:
#       open nvim in a new pane of that window
# - no tmux client, Ghostty running:     open a new Ghostty tab (macOS) or window
#                                        (Linux) running nvim
# - no tmux client, Ghostty not running: launch Ghostty with nvim in its window
#
# Set OPEN_IN_NVIM_WINDOW to a tmux window target to override the "focused
# window" (useful for testing).

# All descendants of a pid, including itself.
function __descendants
    echo $argv[1]
    for child in (pgrep -P $argv[1])
        __descendants $child
    end
end

# RPC socket of the nvim running under pid `$argv[1]`. The TUI process spawns an
# `nvim --embed` server that owns the socket. Default locations:
#   macOS:  $TMPDIR/nvim.$USER/<random>/nvim.<pid>.0
#   Linux:  $XDG_RUNTIME_DIR/nvim.<pid>.0 (or, without XDG_RUNTIME_DIR, the
#           $TMPDIR/nvim.$USER/<random>/ form, with $TMPDIR defaulting to /tmp)
function __nvim_socket
    set -l tmpdir /tmp
    set -q TMPDIR; and set tmpdir (string trim -r -c / -- $TMPDIR)
    set -l dirs $tmpdir/nvim.$USER/*
    if set -q XDG_RUNTIME_DIR; and test -n "$XDG_RUNTIME_DIR"
        set -p dirs (string trim -r -c / -- $XDG_RUNTIME_DIR) (string trim -r -c / -- $XDG_RUNTIME_DIR)/nvim
    end
    for pid in (__descendants $argv[1])
        for dir in $dirs
            for sock in $dir/nvim.$pid.0
                if test -S $sock
                    echo $sock
                    return 0
                end
            end
        end
    end
    return 1
end

# Ask the nvim server at `$argv[1]` to edit `$argv[2]` at line `$argv[3]`, column `$argv[4]`.
function __nvim_send --argument-names sock file line col
    # Escape for `:edit` (space % # | \) and for key notation (<).
    set -l path (string replace -a -r '([ %#|\\\\])' '\\\\$1' -- $file | string replace -a '<' '<lt>')
    set -l cmd "edit $path"
    if test -n "$line"
        test -n "$col"; or set col 1
        set cmd "edit +call\\ cursor($line,$col) $path"
    end
    nvim --server $sock --remote-send "<Cmd>$cmd<CR>" 2>/dev/null
end

function open-in-nvim --description 'Open file[:line[:col]] in nvim (tmux pane, Ghostty tab, or new Ghostty)'
    set -l target $argv[1]
    test -n "$target"; or return 0

    # Split `file:line:col` from the right so paths containing ':' still work.
    set -l file $target
    set -l line ''
    set -l col ''
    set -l parts (string match -r '^(.*):(\d+):(\d+)$' -- $target)
    if test (count $parts) -eq 4
        set file $parts[2]
        set line $parts[3]
        set col $parts[4]
    else
        set parts (string match -r '^(.*):(\d+)$' -- $target)
        if test (count $parts) -eq 3
            set file $parts[2]
            set line $parts[3]
        end
    end

    # Make relative paths absolute (against the caller's cwd, not nvim's). Not
    # normalized: collapsing `..` lexically is wrong after a symlinked dir (e.g. pnpm's
    # node_modules), and nvim/the kernel resolve it correctly.
    string match -q '/*' -- $file; or set file $PWD/$file

    set -l nvim_bin (command -s nvim)
    test -n "$nvim_bin"; or return 1

    set -l nvim_args
    test -n "$line"; and set nvim_args "+$line"
    set nvim_args $nvim_args $file

    set -l dir (path dirname -- $file)

    # Window to use: override, else the active pane of the most recently active client.
    set -l window $OPEN_IN_NVIM_WINDOW
    if test -z "$window"; and tmux list-sessions >/dev/null 2>&1
        set -l client (tmux list-clients -F '#{client_activity} #{client_name}' 2>/dev/null \
            | sort -rn | head -n 1 | string replace -r '^\S+ ' '')
        if test -n "$client"
            set window (tmux display-message -p -c $client '#{window_id}')
        end
    end

    if test -n "$window"
        # First nvim pane in the window that we can reach over RPC.
        for entry in (tmux list-panes -t $window -F '#{pane_id} #{pane_pid} #{pane_current_command}')
            set -l f (string split ' ' -- $entry)
            string match -q -r '^n?vim$' -- $f[3]; or continue
            set -l sock (__nvim_socket $f[2]); or continue
            if __nvim_send $sock $file $line $col
                tmux select-pane -t $f[1]
                return 0
            end
        end

        # No nvim to reuse: new pane in the window.
        tmux split-window -h -t $window -c $dir $nvim_bin $nvim_args
        return 0
    end

    # Linux: no AppleScript or `open`. Ghostty's GTK build has a `+new-window`
    # action that talks to the running instance over D-Bus, and plain `ghostty -e`
    # starts one when it isn't running. There is no CLI for a new tab.
    if test (uname) = Linux
        if pgrep -x ghostty >/dev/null
            ghostty +new-window "--working-directory=$dir" -e $nvim_bin $nvim_args >/dev/null 2>&1 &
        else
            ghostty "--working-directory=$dir" -e $nvim_bin $nvim_args >/dev/null 2>&1 &
        end
        disown
        return 0
    end

    # macOS: Ghostty not running, launch it with nvim as its only window.
    if not pgrep -x ghostty >/dev/null
        open -na Ghostty --args "--working-directory=$dir" -e $nvim_bin $nvim_args
        return 0
    end

    # macOS, Ghostty running: new tab running nvim. Values go through `argv` so nothing
    # needs escaping in the AppleScript source. The command is single-quoted
    # POSIX-style (valid in sh and fish) because Ghostty runs it through a shell.
    set -l quoted
    for arg in $nvim_bin $nvim_args
        set quoted $quoted "'"(string replace -a "'" "'\\''" -- $arg)"'"
    end
    set -l cmd (string join ' ' $quoted)

    set -l applescript '
on run argv
  set theCommand to item 1 of argv
  set theDir to item 2 of argv
  tell application "Ghostty"
    set cfg to new surface configuration
    set command of cfg to theCommand
    set initial working directory of cfg to theDir
    if (count of windows) is 0 then
      new window with configuration cfg
    else
      new tab in front window with configuration cfg
    end if
    activate
  end tell
end run'

    printf '%s\n' $applescript | osascript - $cmd $dir
end
