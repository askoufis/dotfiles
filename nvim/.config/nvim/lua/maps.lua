-- bind to map for convenience
local map = vim.api.nvim_set_keymap

options = { noremap = true }

-- unset the space key
map('n', '<Space>', '', options)
-- map leader to space
vim.g.mapleader = ' '

-- Movement --
-- moving up and down doesn't skip wrapped lines
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)

-- Quickfix --
map('n', '<A-q>', '<cmd>cw<cr>', options)
map('n', '<A-J>', '<cmd>cnext<cr>', options)
map('n', '<A-k>', '<cmd>cprev<cr>', options)

-- Editing --
-- insert a new line below the current line without entering insert mode
map('n', '<cr>', 'o<Esc>', {})
-- remap f1 to escape so it doesn't open help map <F1> <Esc>
map('i', '<F1>', '<Esc>', options)

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
