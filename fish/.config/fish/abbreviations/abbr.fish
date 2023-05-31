# --- Git ---
abbr -a -g ga git add
abbr -a -g gcn git commit -n
abbr -a -g gpf git push --force-with-lease
abbr -a -g gam git commit -n --amend
abbr -a -g gf git fetch --all --prune
abbr -a -g gcm git checkout master
abbr -a -g gfpom 'git fetch --prune && git pull origin master'
# Rebase against the remote branch that your local branch is tracking
# https://stackoverflow.com/a/9753364
abbr -a -g greb "git rebase -i (git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD))"
abbr -a -g grebc git rebase --continue
abbr -a -g gp git push
abbr -a -g gstat git diff --stat
abbr -a -g pom git pull origin master
abbr -a -g gc git checkout
abbr -a -g gpr gh pr view --web
abbr -a -g gup "git fetch && git pull origin (git branch --show-current)"
abbr -a -g nb --position anywhere --set-cursor "git checkout -B % origin/master"

# --- Misc ---
# Emulate other shells' !! feature
function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
abbr -a nvimbench 'hyperfine "nvim --headless +qa" --warmup 5'
# Get latest version of a package in the npm registry
abbr -a -g --set-cursor pv 'npm view % dist-tags.latest'

# --- Config files ---
abbr -a -g sf source $HOME/.config/fish/config.fish

# --- Remaps ---
abbr -a -g se sudoedit
abbr -a -g vim nvim
abbr -a -g v nvim
abbr -a -g ls exa
abbr -a -g la exa -la
abbr -a -g cat bat

# --- tmux ---
# break the current tmux pane into a new window
abbr -a -g tbreak tmux break-pane
