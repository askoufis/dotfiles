# --- Path ---

# rust
fish_add_path $HOME/.cargo/bin

# homebrew complained about this
fish_add_path /usr/local/sbin

# --- General ---

# editors
set -x -g EDITOR nvim
set -x -g GIT_EDITOR nvim
set -x -g MYVIMRC ~/.config/nvim/init.vim

# Set XDG folder
set -x -g XDG_CONFIG_HOME ~/.config

# Set default AWS region
set -x -g AWS_REGION ap-southeast-2

# set fish greeting to be blank
set fish_greeting

set -x -g VOLTA_HOME $HOME/.local/share/.volta
fish_add_path $VOLTA_HOME/bin
