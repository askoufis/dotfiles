-- global options
local o = vim.o
-- window-local options
local wo = vim.wo
-- buffer-local options
local bo = vim.bo

-- Searching
-- show matching strings while performing a search
o.incsearch = true
-- case insensitive search
o.ignorecase = true
-- override ignorecase if the search pattern contains uppercase characters
o.smartcase = true
-- don't persist highlights after searching
o.hlsearch = false

-- Buffers
o.hidden = true

-- Navigation
-- scroll when the cursor is 8 lines from the top/bottom of the screen
o.scrolloff = 8

-- Interface
-- show signs in the same spot as line numbers
wo.signcolumn = 'number'
-- show line number
wo.number = true
-- show line number relative to the current line
wo.relativenumber = true
-- enable 24-bit RGB colours in the TUI (not available in neovim yet I think)
-- o.termguicolours = true
-- show and column number of the cursor
o.ruler = true

-- Text
bo.expandtab = true
bo.shiftwidth = 4
bo.smartindent = true
bo.autoindent = true
bo.smartindent = true
o.smarttab = true
bo.softtabstop = 4
-- bo.cindent = true
-- bo.cinoptions = '(0'

-- Security
o.modelines = 0

-- Splits
o.splitright = true
o.splitbelow = true
