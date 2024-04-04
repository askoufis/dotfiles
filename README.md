# dotfiles

My personal dotfiles.
Inspired by [ThePrimagen's dotfiles].

[theprimagen's dotfiles]: https://github.com/ThePrimeagen/.dotfiles

## Requirements

- [Fish shell] (At least v3.6.0)
- [GNU stow]
- [NotoSansMono Nerd Font][nerd fonts] on linux (Regular, Bold, Italic and Bold Italic)
- [JetBrainsMono Nerd Font][nerd fonts] on mac (Regular, Bold, Italic and Bold Italic)
- [glow]
- [delta]
- [eza]
- [bat]
- [rust-analyzer]: Install with `rustup component add rust-analyzer`
- [rustfmt]: Install with `rustup component add rustfmt`

[fish shell]: https://fishshell.com/
[gnu stow]: https://www.gnu.org/software/stow/
[nerd fonts]: https://www.nerdfonts.com/font-downloads
[glow]: https://github.com/charmbracelet/glow
[delta]: https://github.com/dandavison/delta
[eza]: https://github.com/SEEK-Jobs/metropolis/pull/3248
[bat]: https://github.com/SEEK-Jobs/metropolis/pull/3248
[rust-analyzer]: https://github.com/rust-lang/rust-analyzer
[rustfmt]: https://github.com/rust-lang/rustfmt

## Installation

1. Clone this repo:

```fish
git clone https://github.com/askoufis/dotfiles.git
```

2. Set the `STOW_FOLDERS` envar to the list of folders you want to install:

```fish
set -x -g STOW_FOLDERS alacritty alacritty-linux git nvim fish fish-linux tmux
```

3. Run `./install`

4. (Optional but recommended) Run `sf` to source the `config.fish`. This will add useful abbreviations and set up your environment correctly.

## Bootstrapping

If you're installing dotfiles to a machine for the first time, there's a few things you need to do in order to bootstrap the plugins for various programs.

1. Install [fisher]

2. Run `fisher update`

3. Open `nvim`. It should install [lazy.nvim] automatically.

4. Close `nvim`, then re-open it plugins should start being installed

5. Clone [`tpm`], but not to the usual place:

```fish
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```

[fisher]: https://github.com/jorgebucaran/fisher
[lazy.nvim]: https://github.com/folke/lazy.nvim
[`tpm`]: https://github.com/tmux-plugins/tpm

6. Restart tmux, then press <kbd>prefix</kbd> + <kbd>I</kbd> to install all tmux plugins

## Cleanup

1. Run `./clean`

## Folder structure

Top-level folder names don't really matter, but in most cases they are the same as whatever the config folder name is.
Each top-level folder contains a `.config` folder, since that's my `$XDG_CONFIG_HOME` folder name, and hence where all my config is actually stored.
Inside each `.config` folder is a folder named with the specific config folder name required by a specific app; this folder is where the actual config file(s) are.
For example, the `alacritty` top-level folder contains the following structure: `alacritty/.config/alacritty/alacritty.yml`.

The exception to this is for OS-specific config.
In those cases, a suffix of `-{OS}` is appended to the folder.
For example `alacritty-linux` contains the linux-specific configuration for `alacritty`, whereas `alacritty-mac` contains the macOS-specific configuration for `alacritty`.

## Known issues/bugs

- On MacOS, a warning starting with `BUG in find_stowed_path? Absolute/relative mismatch between Stow dir` is showed when stowing/unstowing folders. According to [this issue], the error is mostly harmless, and should be addressed in future versions of stow.

[this issue]: https://github.com/aspiers/stow/issues/65
