if status --is-interactive
    source ~/.config/fish/ssh.fish
    ssh_agent_init

    # stop Ctrl-s and Ctrl-q from screwing stuff up
    stty -ixon # Commands to run in interactive sessions can go here

    # source private tokens and keys
    set -l PRIVATE_FISH ~/.config/fish/private.fish
    if test -e $PRIVATE_FISH
        source $PRIVATE_FISH
        if test $status -ne 0
            echo "Failed to source private keys from $PRIVATE_FISH"
        end
    end

    # Source env first as other files depend on envars
    # --- Environment ---
    # Source base `env.fish` before OS-specific env files
    source $HOME/.config/fish/environment/env.fish

    if test -e $HOME/.config/fish/environment/env-mac.fish
        source $HOME/.config/fish/environment/env-mac.fish
    end

    if test -e $HOME/.config/fish/environment/env-linux.fish
        source $HOME/.config/fish/environment/env-linux.fish
    end

    # --- Abbreviations
    for FILE in $HOME/.config/fish/abbreviations/*
        source $FILE
    end

    # --- Colorscheme
    source $HOME/.config/fish/colors/moonfly.fish
end
