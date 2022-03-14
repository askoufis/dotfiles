# dotfiles

My personal dotfiles.

## Requirements

- [Fish shell](https://fishshell.com/)
- [GNU stow](https://www.gnu.org/software/stow/)

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

## Bootstrapping

If you're installing dotfiles to a machine for the first time, there's a few things you need to do in order to bootstrap the plugins for various programs.

1. Install [fisher](https://github.com/jorgebucaran/fisher)

2. Run `fisher update`

3. Open `nvim`. It should automatically install vim-plug.

4. Inside neovim, run `:PlugInstall` to install all vim plugins

5. Clone `tpm`, but not to the usual place:

```fish
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins
```

6. Restart tmux, then press `prefix` + `I` to install all tmux plugins

## Cleanup

1. Run `./clean`

TODO:

- [x] Add linux dotfiles
- [ ] Add mac dotfiles
- [x] Make setup/teardown scripts that use `stow`
- [x] Write installation/cleanup instructions
- [x] Write instructions for boostrapping
