function co
    set target (
        find ~/code -mindepth 1 -maxdepth 1 -type d \
        | sed 's|.*/||' \
        | fzf --reverse --height 40% --tmux 30%,20%
    )

    if test -n "$target"
        cd ~/code/$target
    else
        echo "No project selected"
    end

end
