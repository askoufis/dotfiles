if status --is-interactive
    source ~/.config/fish/ssh.fish
    ssh_agent_init

    # stop Ctrl-s and Ctrl-q from screwing stuff up
    stty -ixon # Commands to run in interactive sessions can go here

    # source the contents of the `private` directory
    for FILE in $HOME/.config/fish/private/*
        source $FILE
    end

    # Source env first as other files depend on envars
    # --- Environment ---
    # Source base `env.fish` before OS-specific env files
    source $HOME/.config/fish/environment/env.fish

    # OS-specific env files
    for FILE in $HOME/.config/fish/environment/env-*
        source $FILE
    end

    # --- Abbreviations
    for FILE in $HOME/.config/fish/abbreviations/*
        source $FILE
    end

    # --- Colorscheme
    source $HOME/.config/fish/colors/moonfly.fish

    # --- Zoxide
    zoxide init fish | source

    # --- Mise
    ~/.local/bin/mise activate fish | source
end
