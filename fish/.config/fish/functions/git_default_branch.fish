function git_default_branch
    git symbolic-ref refs/remotes/origin/HEAD | sed 's|^refs/remotes/origin/||'
end
