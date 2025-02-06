function greb
    echo (string join ' ' 'git rebase -i' (git_remote_branch))
end
