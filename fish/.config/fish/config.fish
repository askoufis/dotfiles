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
    for FILE in $HOME/.config/fish/environment/*
        source $FILE
    end

    # --- Abbreviations
    for FILE in $HOME/.config/fish/abbreviations/*
        source $FILE
    end

    # --- Prompt --- https://github.com/pure-fish/pure
    _pure_set_default pure_show_subsecond_command_duration true
end
