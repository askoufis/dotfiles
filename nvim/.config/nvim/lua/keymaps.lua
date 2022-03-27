-- bind to map for convenience
local map = vim.api.nvim_set_keymap

local options = { noremap = true, silent = true }
local loud_options = { noremap = true }

-- unset the space key
map('n', '<Space>', '', options)
-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Movement --
-- moving up and down doesn't skip wrapped lines
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)
-- Better movement between splits
map('n', '<C-j>', '<C-w><C-j>', options)
map('n', '<C-k>', '<C-w><C-k>', options)
map('n', '<C-l>', '<C-w><C-l>', options)
map('n', '<C-h>', '<C-w><C-h>', options)

-- Highlights
map('n', '<leader>n', '<cmd>noh<cr>', options)

-- Buffers
map('n', '<leader>l', '<cmd>bnext<cr>', options)
map('n', '<leader>k', '<cmd>bprev<cr>', options)

-- Quickfix --
map('n', '<A-q>', '<cmd>cw<cr>', options)
map('n', '<A-j>', '<cmd>cnext<cr>', options)
map('n', '<A-k>', '<cmd>cprev<cr>', options)

-- LSP
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
-- Too used to vscode
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', options)

-- Editing --
-- insert a new line below the current line without entering insert mode
map('n', '<cr>', 'o<Esc>', {})
-- remap f1 to escape so it doesn't open help map <F1> <Esc>
map('i', '<F1>', '<Esc>', options)
-- globally replace the word under the cursor
map('n', '<leader>*', ':%s/<c-r><c-w>//g<left><left>', options)

-- Vimrc --
-- open vimrc in a vertical split
map('n', '<leader>ev', '<cmd>vsplit $MYVIMRC<cr>', options)
-- source vimrc
map('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>', options)
-- source vimrc and run PlugInstall
map('n', '<leader>sp', '<cmd>so $MYVIMRC<cr><cmd>PlugInstall<cr>', options)

-- Other -- 
-- Open explorer, aka netrw
map('n', '<leader>x', '<cmd>Ex<cr>', options)
