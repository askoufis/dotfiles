-- bind to map for convenience
local map = vim.api.nvim_set_keymap
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

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

-- Window
-- Better movement between splits
map('n', '<C-j>', '<C-w><C-j>', options)
map('n', '<C-k>', '<C-w><C-k>', options)
map('n', '<C-l>', '<C-w><C-l>', options)
map('n', '<C-h>', '<C-w><C-h>', options)
-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", options)
map("n", "<C-Down>", ":resize +2<CR>", options)
map("n", "<C-Left>", ":vertical resize -2<CR>", options)
map("n", "<C-Right>", ":vertical resize +2<CR>", options)


-- Highlights
map('n', '<leader>n', ':noh<cr>', options)

-- Navigating uffers
map('n', '<S-l>', ':bnext<CR>', options)
map('n', '<S-h>', ':bprev<CR>', options)

-- Visual
-- Stay in indent mode
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- Quickfix
-- map('n', '<A-q>', '<cmd>cw<cr>', options)
-- map('n', '<A-j>', '<cmd>cnext<cr>', options)
-- map('n', '<A-k>', '<cmd>cprev<cr>', options)

-- LSP
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', options)
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', options)
-- Too used to vscode
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', options)

-- Editing --
-- insert a new line below the current line without entering insert mode
map('n', '<cr>', 'o<Esc>', {})
-- remap f1 to escape so it doesn't open help
map('i', '<F1>', '<Esc>', options)
-- globally replace the word under the cursor
map('n', '<leader>*', ':%s/<c-r><c-w>//g<left><left>', options)
-- move text up and down
-- Normal
map('n', '<A-j>', ':m .+1<CR>==', options);
map('n', '<A-k>', ':m .-2<CR>==', options);
-- Visual
map('v', '<A-j>', ':m .+1<CR>==', options);
map('v', '<A-k>', ':m .-2<CR>==', options);
-- Visual block
map('x', '<A-j>', ":m '>+1<CR>gv-gv", options)
map('x', '<A-k>', ":m '<-2<CR>gv-gv", options)

-- Pasting
-- Don't yank to buffer when pasting
map('v', 'p', '"_dP', options)

-- Other -- 
-- Open explorer, aka netrw
map('n', '<leader>x', ':Lex 30<CR>', options)

-- write to a file when you accidentally opened it without root privileges
map('c', 'w!!', 'w !sudo tee % > /dev/null', options) 

-- Glow
map('n', '<leader>mp', ':Glow<CR>', options)
