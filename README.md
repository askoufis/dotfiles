# dotfiles

My personal dotfiles.
Inspired by [ThePrimagen's dotfiles].

[theprimagen's dotfiles]: https://github.com/ThePrimeagen/.dotfiles

## Requirements

- [Fish shell] (At least v4.0.0)
- [neovim]
- [GNU stow] (Only if you want to use the [install] script)
- [JetBrainsMono] (Regular, Bold, Italic and Bold Italic)
- [delta]
- [eza]
- [bat]
- [rust-analyzer]: Install with `rustup component add rust-analyzer`
- [rustfmt]: Install with `rustup component add rustfmt`

[fish shell]: https://fishshell.com/
[neovim]: https://neovim.io/
[gnu stow]: https://www.gnu.org/software/stow/
[install]: ./install
[jetbrainsmono]: https://www.jetbrains.com/lp/mono/
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

2. Set the `$STOW_FOLDERS` environment variable to a space-separated list of folders you want to install:

```fish
set -x -g STOW_FOLDERS ghostty ghostty-linux git nvim fish fish-linux tmux
```

A valid folder names is any top-level folder in this repo.

3. Run `./install`

4. (Optional but recommended) Run `sf` to source the `config.fish`. This will add useful abbreviations and set up your environment correctly.

## Bootstrapping

After installing dotfiles to a machine for the first time, there's a few things you need to do in order to bootstrap the plugins for various programs.

1. Install [fisher]

2. Run `fisher update`

3. Open `nvim`. It should install [lazy.nvim] and plugins automatically.

4. Close `nvim`, then re-open it and open some files to confirm that all plugins are installed correctly

5. Clone [`tpm`], but not to the usual place:

```fish
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```

6. Restart tmux, then press <kbd>prefix</kbd> + <kbd>I</kbd> to install all tmux plugins

[fisher]: https://github.com/jorgebucaran/fisher
[lazy.nvim]: https://github.com/folke/lazy.nvim
[`tpm`]: https://github.com/tmux-plugins/tpm

## Cleanup

1. Run `./clean`

## Folder structure

Top-level folder names don't really matter, but in most cases they are the same as whatever the app's config folder name is.
Each top-level folder contains a `.config` folder as that's my `$XDG_CONFIG_HOME` folder name, and hence where all my config is actually stored.

Inside each `.config` folder is the app's config folder; this folder is where the actual config file(s) are.
For example, the `ghostty` top-level folder contains the following structure: `ghostty/.config/ghostty/ghostty.yml`.

The exception to this is for OS-specific config.
In those cases, a suffix of `-{OS}` is appended to the folder.
For example `ghostty-linux` contains the linux-specific configuration for `ghostty`, whereas `ghostty-mac` contains the macOS-specific configuration for `ghostty`.
OS-specific configuration is usually included into the main configuration file via some method exposed by the app you're configuring.
For example, `ghostty` supports including other `.toml` files within your man config file.
