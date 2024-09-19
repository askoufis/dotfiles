-- Searching
-- show matching strings while performing a search
vim.opt.incsearch = true
-- Show search/substitution matches in a split
vim.opt.inccommand = 'split'
-- case insensitive search
vim.opt.ignorecase = true
-- override ignorecase if the search pattern contains uppercase characters
vim.opt.smartcase = true
-- don't persist highlights after searching
vim.opt.hlsearch = false

-- Navigation
-- scroll when the cursor is 8 lines from the top of the screen
vim.opt.scrolloff = 8

-- Mouse
-- Allow the mouse to be used
vim.opt.mouse = 'a'

-- Interface
-- Always show a 1-column-wide sign column
vim.opt.signcolumn = 'yes:1'
-- show line number
vim.opt.number = true
-- show line number relative to the current line
vim.opt.relativenumber = true
-- show and column number of the cursor
vim.opt.ruler = true
-- Highlight the current line
vim.opt.cursorline = true

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
vim.opt.wrap = true

-- Security (apparently)
vim.opt.modelines = 0

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Netrw
-- Even though nvim-tree is installed, worth keeping these settings
-- just in case I ever need to use netrw for some reason
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'nomodifiable nomodified number nowrap readonly nobuflisted'

-- Misc.
vim.opt.undolevels = 1000
vim.opt.lazyredraw = true

-- Moonfly
vim.g.moonflyNormalFloat = 1
vim.g.moonflyCursorColor = 1
-- Line separators
vim.g.moonflyWinSeparator = 2
-- Better line separators
vim.opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

-- For FixCursorHold.nvim
vim.g.cursorhold_updatetime = 100

-- Skip backwards compat for nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true

-- Spell
vim.opt.spelllang = 'en_au'

-- Disable swapfiles and instead trigger autoread every time a buffer is entered/focused
vim.opt.swapfile = false
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = { '*.*' },
  callback = function()
    vim.cmd([[checktime]])
  end,
})
