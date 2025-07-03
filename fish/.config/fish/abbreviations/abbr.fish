# --- Git ---
abbr -a -g ga git add
abbr -a -g gcn git commit -n
abbr -a -g gpf git push --force-with-lease
abbr -a -g gam git commit -n --amend
abbr -a -g gf git fetch --all --prune
abbr -a -g gcm --function gcm
abbr -a -g gfpom --function gfpom
# Rebase against the remote branch that your local branch is tracking
# https://stackoverflow.com/a/9753364
abbr -a -g greb --function greb
abbr -a -g grebc git rebase --continue
abbr -a -g gp git push
abbr -a -g gstat git diff --stat
abbr -a -g gc git checkout
abbr -a -g gpr gh pr view --web
abbr -a -g gor gh repo view --web
abbr -a -g gup "git fetch && git pull origin (git branch --show-current)"
abbr -a -g nb --set-cursor --function nb
abbr -a -g grh --position anywhere --set-cursor "git reset origin/(git branch --show-current) --hard"

# --- Misc ---
# Emulate other shells' !! feature
function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
abbr -a nvimbench 'hyperfine "nvim --headless +qa" --warmup 5'
# Get latest version of a package in the npm registry
abbr -a -g --set-cursor pv 'npm view % dist-tags.latest'

# --- Config files ---
abbr -a -g sf source $HOME/.config/fish/config.fish
abbr -a -g dots cd ~/code/askoufis/dotfiles

# --- Remaps ---
abbr -a -g se sudoedit
abbr -a -g vim nvim
abbr -a -g v nvim
abbr -a -g ls eza
abbr -a -g la eza -la
abbr -a -g cat bat

# --- tmux ---
# break the current tmux pane into a new window
abbr -a -g tbreak tmux break-pane
