function gfpom
    echo (string join ' ' 'git fetch --prune && git pull origin' (git_default_branch))
end
