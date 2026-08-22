function co -d "Change to a project directory with fzf"
    # Directories whose immediate children are projects
    set -l roots ~/code ~/code/askoufis
    # Standalone directories listed alongside the projects
    set -l extras ~/.config

    set -l dirs (fd . $roots --type d --exact-depth 1 --color never | path normalize) $extras

    # Each entry is "<label>\t<path>": fzf shows the label, returns the path
    set -l entries
    for dir in $dirs
        set -a entries (string replace --regex "^$HOME/(code/)?" '' -- $dir)\t$dir
    end

    set -l target (
        printf '%s\n' $entries \
        | fzf --reverse --height 40% --tmux 30%,20% \
            --delimiter \t --with-nth 1 --accept-nth 2
    )

    if test -n "$target"
        cd $target
    else
        echo "No project selected"
    end

end
