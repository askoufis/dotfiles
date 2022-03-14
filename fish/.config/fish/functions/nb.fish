function nb --description 'Create a new git branch tracking origin/master'
    set -l branch $argv[1]
    if test -n "$branch"
        git checkout -B $branch origin/master
    else
        echo "Missing branch name. Usage: 'nb <BRANCH>'"
    end
end
