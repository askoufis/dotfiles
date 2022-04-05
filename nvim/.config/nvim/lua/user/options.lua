-- Searching
-- show matching strings while performing a search
vim.opt.incsearch = true
-- case insensitive search
vim.opt.ignorecase = true
-- override ignorecase if the search pattern contains uppercase characters
vim.opt.smartcase = true
-- don't persist highlights after searching
vim.opt.hlsearch = false

-- Navigation
-- scroll when the cursor is 8 lines from the top/vim.opt.tom of the screen
vim.opt.scrolloff = 8

-- Mouse
-- Allow the mouse to be used
vim.opt.mouse = 'a'

-- Colors
-- enable 24-bit RGB colours in the TUI
-- make colours appear correctly with tmux + alacritty
-- https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6#vim-neovim
vim.opt.termguicolors = true

-- Interface
-- show signs in the same spot as line numbers
vim.opt.signcolumn = 'yes'
-- show line number
vim.opt.number = true
-- show line number relative to the current line
vim.opt.relativenumber = true
-- show and column number of the cursor
vim.opt.ruler = true

-- Text
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.cindent = true
vim.opt.cinoptions = '(0'
vim.opt.showmatch = true
vim.opt.linebreak = true
vim.opt.textwidth = 100

-- Formatting
-- vim.opt.formatoptions:remove { 't' }

-- Security (apparently)
vim.opt.modelines = 0

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

-- Misc.
vim.opt.undolevels = 1000
vim.opt.lazyredraw = true
