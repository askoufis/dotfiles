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

-- Buffers
-- Navigating buffers with cokeline
-- https://vi.stackexchange.com/a/31013 for info why these have to be non-recursive maps
map('n', '<S-h>', '<Plug>(cokeline-focus-prev)', { noremap = false })
map('n', '<S-l>', '<Plug>(cokeline-focus-next)', { noremap = false })
map('n', '<Leader>p', '<Plug>(cokeline-switch-prev)', { noremap = false })
map('n', '<Leader>n', '<Plug>(cokeline-switch-next)', { noremap = false })
map('n', '<Leader>x', '<Plug>(cokeline-pick-close)', { noremap = false })

for i = 1, 9 do
  map('n', ('<Leader>s%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { noremap = false })
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { noremap = false })
end

-- Delete all buffers except for the current buffer
local delete_other_buffers = function()
  local buffers = vim.api.nvim_list_bufs()
  local current_buffer = vim.api.nvim_get_current_buf()

  for _, buffer in ipairs(buffers) do
    local is_loaded = vim.api.nvim_buf_is_loaded(buffer)
    local is_current_buffer = buffer == current_buffer

    if is_loaded and not is_current_buffer then
      vim.api.nvim_buf_delete(buffer, {})
    end
  end
end
map('n', '<leader>bo', delete_other_buffers)
-- Delete all buffers
map('n', '<leader>bd', ':%bd<CR>')

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

-- Other --
-- Open explorer, aka netrw
map('n', '\\', ':Neotree toggle<CR>')

-- write to a file when you accidentally opened it without root privileges
map('c', 'w!!', 'w !sudo tee % > /dev/null')

-- Glow
map('n', '<leader>mp', ':Glow<CR>')

-- Neogit
map('n', '<leader>G', ':Neogit<CR>')

-- Luasnip
map('n', '<leader><leader>s', ':source ~/.config/nvim/lua/user/luasnip.lua<CR>')

-- Run the current file
map('n', '<leader><leader>x', ':w<CR>:source %<CR>')

-- Better keymaps for increment and decrement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')
-- Keep the visual selection after incrementing/decrementing
map('x', '+', 'g<C-a>gv')
map('x', '-', 'g<C-x>gv')

-- Set filetype to nginx in-case the plugin doesn't detect the filetype correctly
map('n', '<leader>r', ':set ft=nginx<CR>')

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
