function nb
    echo (string join '' 'git checkout -B % origin/' (git_default_branch))
end
