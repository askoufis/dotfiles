function sshagent_findsockets
    find /tmp -uid (id -u) -type s -name agent.\* 2>/dev/null
end

function sshagent_testsocket
    if [ ! -x (command which ssh-add) ]
        echo "ssh-add is not available; agent testing aborted"
        return 1
    end

    if [ X"$argv[1]" != X ]
        set -xg SSH_AUTH_SOCK $argv[1]
    end

    if [ X"$SSH_AUTH_SOCK" = X ]
        return 2
    end

    if [ -S $SSH_AUTH_SOCK ]
        ssh-add -l >/dev/null
        if [ $status = 2 ]
            echo "Socket $SSH_AUTH_SOCK is dead!  Deleting!"
            rm -f $SSH_AUTH_SOCK
            return 4
        else
            echo "Found ssh-agent $SSH_AUTH_SOCK"
            return 0
        end
    else
        echo "$SSH_AUTH_SOCK is not a socket!"
        return 3
    end
end


function ssh_agent_init
    # ssh agent sockets can be attached to a ssh daemon process or an
    # ssh-agent process.

    set -l AGENTFOUND 0

    # Attempt to find and use the ssh-agent in the current environment
    if sshagent_testsocket
        set AGENTFOUND 1
    end

    # If there is no agent in the environment, search /tmp for
    # possible agents to reuse before starting a fresh ssh-agent
    # process.
    if [ $AGENTFOUND = 0 ]
        for agentsocket in (sshagent_findsockets)
            if [ $AGENTFOUND != 0 ]
                break
            end
            if sshagent_testsocket $agentsocket
                set AGENTFOUND 1
            end

        end
    end

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if [ $AGENTFOUND = 0 ]
        echo need to start a new agent
        eval (ssh-agent -c)
    end

    # Finally, show what keys are currently in the agent
    # ssh-add -l
end

if status --is-interactive
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
