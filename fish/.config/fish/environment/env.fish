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

# Configure mise
set -x -g MISE_NODE_COREPACK true

fish_add_path -pP ~/.bun/bin
fish_add_path -pP ~/.local/bin

# Set `bat` as the `man` pager
# https://github.com/sharkdp/bat/#man
set -x -g MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x -g MANROFFOPT "-c"

set -x -g BAT_THEME "fly16"

# Custom editor launch script so inspector plugins work with neovim
# https://theosteiner.de/open-neovim-from-your-browser-integrating-nvim-with-sveltes-inspector
set -x -g LAUNCH_EDITOR launch_editor_script

# Hydro prompt config
# https://github.com/jorgebucaran/hydro
set --global hydro_color_pwd blue
set --global hydro_color_prompt purple
set --global hydro_color_duration yellow
set --global hydro_fetch true
