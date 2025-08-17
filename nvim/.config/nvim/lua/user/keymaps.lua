-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- unset the space key
set_keymap('n', '<Space>', '')
-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Movement
-- moving up and down doesn't skip wrapped lines
set_keymap('n', 'j', 'gj')
set_keymap('n', 'k', 'gk')

-- Move up and down while staying centred vertically
set_keymap('n', '<C-u>', '<C-u>zz')
set_keymap('n', '<C-d>', '<C-d>zz')

-- Resize with arrows
set_keymap('n', '<C-Up>', ':resize -2<CR>')
set_keymap('n', '<C-Down>', ':resize +2<CR>')
set_keymap('n', '<C-Left>', ':vertical resize -2<CR>')
set_keymap('n', '<C-Right>', ':vertical resize +2<CR>')

-- Make all windows (almost) equally high and wide
set_keymap('n', '<leader>w', ':wincmd =<CR>')

-- Highlights
set_keymap('n', '<leader>n', ':noh<CR>')

-- Visual
-- Stay in indent mode
set_keymap('v', '<', '<gv')
set_keymap('v', '>', '>gv')

-- Quickfix
set_keymap('n', '<A-q>', ':cw<CR>')
set_keymap('n', '<leader>j', function()
  P("Use default ']q' instead")
end)
set_keymap('n', '<leader>k', function()
  P("Use default '[q' instead")
end)

-- Editing
-- insert a new line below the current line without entering insert mode
set_keymap('n', '<CR>', 'o<Esc>', {})
-- remap f1 to escape so it doesn't open help
set_keymap('i', '<F1>', '<Esc>')
-- globally replace the word under the cursor
set_keymap('n', '<leader>*', ':%s/<c-r><c-w>//g<left><left>')

-- move text up and down
set_keymap({ 'n', 'v' }, '<A-j>', ':m +1<CR>')
set_keymap({ 'n', 'v' }, '<A-k>', ':m -2<CR>')
-- Visual block keymaps need to be different in order to keep the cursor on the same line after moving
set_keymap('x', '<A-j>', ":m '>+1<CR>gv")
set_keymap('x', '<A-k>', ":m '<-2<CR>gv")

-- Clipboard
-- Don't yank to buffer when pasting
set_keymap('v', 'p', '"_dP')
-- Yank to clipboard
set_keymap({ 'v', 'x' }, '<leader>y', '"+y')
set_keymap({ 'v', 'x' }, '<leader>d', '"+d')

-- Searching
-- Move to search and center the current line vertically
-- Can append `zv` to these to open folds
set_keymap('n', 'n', 'nzz')
set_keymap('n', 'N', 'Nzz')

-- write to a file when you accidentally opened it without root privileges
set_keymap('c', 'w!!', 'w !sudo tee % > /dev/null')

-- Run the current file
set_keymap('n', '<leader><leader>x', ':w<CR>:source %<CR>')

-- Better keymaps for increment and decrement
set_keymap('n', '+', '<C-a>')
set_keymap('n', '-', '<C-x>')
-- Keep the visual selection after incrementing/decrementing
set_keymap('x', '+', 'g<C-a>gv')
set_keymap('x', '-', 'g<C-x>gv')

-- Spell

--- Toggle the spell option
local toggle_spell = function()
  if vim.opt_local.spell:get() then
    vim.opt_local.spell = false
  else
    vim.opt_local.spell = true
  end
end
set_keymap('n', '<leader>sp', toggle_spell)
set_keymap('n', '<leader>zc', '1z=', { desc = 'Accept the first spelling suggestion' })

-- Utilities
set_keymap('n', '<leader>cl', ':g/console\\.log/d<CR>')

-- LSP
set_keymap('n', 'gi', function()
  P("Use default 'gri' instead")
end, { desc = 'LSP implementations' })
set_keymap('n', 'gd', function()
  P("Use 'grd' instead")
end, { desc = 'LSP definitions' })
set_keymap('n', 'grd', function()
  vim.lsp.buf.definition()
end, { desc = 'LSP definitions' })
set_keymap('n', '<F2>', function()
  P("Use default 'grn' instead")
end, { desc = 'LSP rename' }) -- Too used to vscode
set_keymap('n', 'gr', function()
  P("Use default 'grr' instead")
end, { desc = 'LSP references' })
set_keymap('n', 'gl', vim.diagnostic.open_float)
set_keymap('n', '<leader>lr', ':LspRestart<CR>')
