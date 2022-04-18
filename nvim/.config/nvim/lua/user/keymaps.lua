local map = vim.keymap.set

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

-- Overwrite <C-l> within netrw to it doesn't refresh the terminal
-- https://github.com/christoomey/vim-tmux-navigator/issues/189#issuecomment-620485838
-- NvimTree has its own filetype even though it hijacks netrw, but worth keeping this around just in case
-- local netrw_mapping = vim.api.nvim_create_augroup('netrw_mapping', {})
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'netrw',
--   group = netrw_mapping,
--   callback = function(args)
--     vim.notify(vim.inspect(args))
--     vim.notify(tostring(args.buf))
--     vim.keymap.set('n', '<C-l>', require('tmux').move_right, { buffer = 0 })
--   end,
-- })

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Highlights
map('n', '<leader>n', ':noh<CR>')

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
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
-- Visual
map('v', '<A-j>', ':m .+1<CR>==')
map('v', '<A-k>', ':m .-2<CR>==')
-- Visual block
map('x', '<A-j>', ':m \'>+1<CR>gv-gv')
map('x', '<A-k>', ':m \'<-2<CR>gv-gv')

-- Pasting
-- Don't yank to buffer when pasting
map('v', 'p', '"_dP')

-- Other --
-- Open explorer, aka netrw
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- write to a file when you accidentally opened it without root privileges
map('c', 'w!!', 'w !sudo tee % > /dev/null')

-- Glow
map('n', '<leader>mp', ':Glow<CR>')

-- Neogit
map('n', '<leader>G', ':Neogit<CR>')
