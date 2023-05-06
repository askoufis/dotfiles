# rust
fish_add_path -aP $HOME/.cargo/bin

# editors
set -x -g EDITOR nvim
set -x -g GIT_EDITOR nvim
set -x -g MYVIMRC ~/.config/nvim/init.lua

# Set XDG folder
set -x -g XDG_CONFIG_HOME ~/.config

# Set default AWS region
set -x -g AWS_REGION ap-southeast-2

# set fish greeting to be blank
set fish_greeting

set -x -g VOLTA_HOME $HOME/.local/share/.volta
fish_add_path -pP $VOLTA_HOME/bin

fish_add_path -pP ~/.bun/bin
fish_add_path -pP ~/.local/bin

# Set `bat` as the `man` pager
# https://github.com/sharkdp/bat/#man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
