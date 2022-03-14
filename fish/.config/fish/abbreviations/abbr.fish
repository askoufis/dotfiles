# --- Git ---
abbr -a -g ga git add
abbr -a -g gcn git commit -n
abbr -a -g gpf git push --force-with-lease
abbr -a -g gam git commit --amend
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

# --- Misc ---

# --- Config files ---
abbr -a -g ef $EDITOR $HOME/.config/fish/config.fish
abbr -a -g sf source $HOME/.config/fish/config.fish
abbr -a -g et $EDITOR $HOME/.config/tmux/tmux.conf
abbr -a -g ev $EDITOR $HOME/.config/nvim/init.vim
abbr -a -g eabbr $EDITOR $HOME/.config/fish/abbreviations/abbr.fish

# --- Remaps ---
abbr -a -g se sudoedit
abbr -a -g vim nvim
abbr -a -g v nvim .
abbr -a -g ls exa
abbr -a -g la exa -la
abbr -a -g cat bat

# --- tmux ---
# break the current tmux pane into a new window
abbr -a -g tbreak tmux break-pane
