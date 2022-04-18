local prequire = require('prequire')
local toggleterm = prequire('toggleterm')

toggleterm.setup {
  size = function()
    return 16
  end,
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  shell = vim.o.shell,
}

-- Toggleterm
function _G.set_terminal_keymaps()
  local function buf_map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = 0
    vim.keymap.set(mode, l, r, opts)
  end

  buf_map('t', '<ESC>', [[<C-\><C-n>]])
  buf_map('t', '<C-h>', [[<C-\><C-n><C-w>h]])
  buf_map('t', '<C-j>', [[<C-\><C-n><C-w>j]])
  buf_map('t', '<C-k>', [[<C-\><C-n><C-w>k]])
  buf_map('t', '<C-l>', [[<C-\><C-n><C-w>l]])
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*',
  callback = set_terminal_keymaps,
})
