function nb
    echo (string join ' ' 'git checkout -B %' (git_remote_branch))
end
