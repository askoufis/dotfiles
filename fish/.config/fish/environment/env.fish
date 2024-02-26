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

set -x -g VOLTA_FEATURE_PNPM 1

fish_add_path -pP ~/.bun/bin
fish_add_path -pP ~/.local/bin

# Set `bat` as the `man` pager
# https://github.com/sharkdp/bat/#man
set -x -g MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x -g MANROFFOPT "-c"

# Custom editor launch script so inspector plugins work with neovim
# https://theosteiner.de/open-neovim-from-your-browser-integrating-nvim-with-sveltes-inspector
set -x -g LAUNCH_EDITOR launch_editor_script

# Pure prompt config
# https://pure-fish.github.io/pure/

# Disable some settings for environments I rarely use
set --universal pure_enable_virtualenv false
set --universal pure_enable_container_detection false
set --universal pure_enable_aws_profile false
