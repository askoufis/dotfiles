set -x -g STOW_FOLDERS alacritty alacritty-mac ghostty git nvim fish fish-mac tmux tmuxinator
eval (/opt/homebrew/bin/brew shellenv)

# Something is overriding $SHELL to be `/bin/sh`, so force it to be fish instead so tmux starts with fish
set -x -g SHELL /opt/homebrew/bin/fish

