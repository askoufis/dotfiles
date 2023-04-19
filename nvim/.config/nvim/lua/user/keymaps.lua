local map = function(mode, l, r, opts)
  opts = opts or { silent = true }
  vim.keymap.set(mode, l, r, opts)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- unset the space key
map('n', '<Space>', '')
-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Movement --
-- moving up and down doesn't skip wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Move up and down while staying centred vertically
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Make all windows (almost) equally high and wide
map('n', '<Leader>w', ':wincmd =<CR>')

-- Highlights
map('n', '<Leader>n', ':noh<CR>')

local buffer_deletion = require('user.utilities.buffer-deletion')
map('n', '<leader>bo', buffer_deletion.delete_other_buffers)
-- Not using `:%bd<CR>` so we can preserve the NeoGit console buffer
map('n', '<leader>bd', buffer_deletion.delete_all_buffers)
map('n', '<leader>bn', buffer_deletion.delete_node_modules_buffers)

-- Visual
-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Quickfix
map('n', '<A-q>', ':cw<CR>')
map('n', '<leader>j', ':cnext<CR>')
map('n', '<leader>k', ':cprev<CR>')

-- Editing --
-- insert a new line below the current line without entering insert mode
map('n', '<CR>', 'o<Esc>', {})
-- remap f1 to escape so it doesn't open help
map('i', '<F1>', '<Esc>')
-- globally replace the word under the cursor
map('n', '<leader>*', ':%s/<c-r><c-w>//g<left><left>')

-- move text up and down
-- Normal
map('n', '<A-j>', ':m +1<CR>')
map('n', '<A-k>', ':m -2<CR>')
-- Visual
map('v', '<A-j>', ':m +1<CR>')
map('v', '<A-k>', ':m -2<CR>')
-- Visual block
map('x', '<A-j>', ":m '>+1<CR>gv")
map('x', '<A-k>', ":m '<-2<CR>gv")

-- Pasting
-- Don't yank to buffer when pasting
map('v', 'p', '"_dP')
-- Yank to clipboard
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')

-- Searching
-- Move to search and centre the current line vertically
-- Can append `zv` to these to open folds
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- write to a file when you accidentally opened it without root privileges
map('c', 'w!!', 'w !sudo tee % > /dev/null')

-- Run the current file
map('n', '<leader><leader>x', ':w<CR>:source %<CR>')

-- Better keymaps for increment and decrement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')
-- Keep the visual selection after incrementing/decrementing
map('x', '+', 'g<C-a>gv')
map('x', '-', 'g<C-x>gv')

-- Spell

--- Toggle the spell option
local toggle_spell = function()
  if vim.opt_local.spell:get() then
    vim.opt_local.spell = false
  else
    vim.opt_local.spell = true
  end
end
map('n', '<leader>sp', toggle_spell)
