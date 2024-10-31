set -x -g STOW_FOLDERS alacritty alacritty-mac bat ghostty ghostty-mac git nvim fish fish-mac tmux tmuxinator
eval (/opt/homebrew/bin/brew shellenv)

# Something is overriding $SHELL to be `/bin/sh`, so force it to be fish instead so tmux starts with fish
set -x -g SHELL /opt/homebrew/bin/fish

# Increase the maximum number of open files and processes
# https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
ulimit -n 200000
ulimit -u 2048
