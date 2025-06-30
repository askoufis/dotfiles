function co -d "Change to a project directory with fzf"
    set target (
        fd . ~/code ~/code/askoufis --type d --exact-depth 1 --color never \
        | string replace "$HOME/code" '' \
        | string trim --chars '/' \
        | fzf --reverse --height 40% --tmux 30%,20%
    )

    if test -n "$target"
        cd ~/code/$target
    else
        echo "No project selected"
    end

end
