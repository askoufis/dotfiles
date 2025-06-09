function gc
    set branch (
        git for-each-ref --sort=-committerdate \
            --format='%(refname:short)|%(committerdate:short)|%(subject)' refs/heads/ \
        | awk -F'|' '{printf "%s\t%s\t%.50s\n", $1, $2, $3}' \
        | column -ts \t \
        | fzf --no-sort --reverse --height 40% --tmux \
        | awk '{print $1}'
    )

    if test -n "$branch"
        git checkout $branch
    end
end

