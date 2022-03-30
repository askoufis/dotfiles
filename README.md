# dotfiles

My personal dotfiles. Inspired by [ThePrimagen's dotfiles][dotfiles].

[dotfiles]: https://github.com/ThePrimeagen/.dotfiles

## Requirements

- [Fish shell]
- [GNU stow]
- [NotoSansMono Nerd Font][nerd fonts] on linux (Regular, Bold, Italic and Bold Italic)
- [RobotoMono Nerd Font][nerd fonts] on mac (Regular, Bold, Italic and Bold Italic)
- [ripgrep]
- [fd]

[fish shell]: https://fishshell.com/
[gnu stow]: https://www.gnu.org/software/stow/
[nerd fonts]: https://www.nerdfonts.com/font-downloads
[ripgrep]: https://github.com/BurntSushi/ripgrep
[fd]: https://github.com/sharkdp/fd

## Installation

1. Clone this repo:

```fish
git clone https://github.com/askoufis/dotfiles.git
```

2. Set the `STOW_FOLDERS` envar to the list of folders you want to install:

```fish
set -x -g STOW_FOLDERS alacritty nvim fish fish-linux tmux
```

3. Run `./install`

4. (Optional but recommended) Run `sf` to source the `config.fish`. This will add useful abbreviations and set up your environment correctly.

## Bootstrapping

If you're installing dotfiles to a machine for the first time, there's a few things you need to do in order to bootstrap the plugins for various programs.

1. Install [fisher]

2. Run `fisher update`

3. Open `nvim`. It should install [packer] automatically.

4. Close `nvim`, then re-open it and run `:PackerSync` to install all plugins

5. Clone `tpm`, but not to the usual place:

```fish
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```

[fisher]: https://github.com/jorgebucaran/fisher
[packer]: https://github.com/wbthomason/packer.nvim

6. Restart tmux, then press `prefix` + `I` to install all tmux plugins

## Cleanup

1. Run `./clean`

## Folder structure

Top-level folder names don't really matter, but in most cases they are the same as whatever the config folder name is. Each top-level folder contains a `.config` folder, since that's my `$XDG_CONFIG_HOME` folder name, and hence where all my config is actually stored. Inside each `.config` folder is a folder named with the specific config folder name required by a specific app; this folder is where the actual config file(s) are. For example, the `alacritty` top-level folder contains the following structure: `alacritty/.config/alacritty/alacritty.yml`.

The exception to this is for OS-specific config. In those cases, a suffix of `-{OS}` is appended to the folder. For example `alacritty-linux` contains the linux-specific configuration for `alacritty`, whereas `alacritty-mac` contains the macOS-specific configuration for `alacritty`.

## Known issues/bugs

- On MacOS, a warning starting with `BUG in find_stowed_path? Absolute/relative mismatch between Stow dir` is showed when stowing/unstowing folders. According to [this issue][issue], the error is mostly harmless, and should be addressed in future versions stow.

[issue]: https://github.com/aspiers/stow/issues/65
