vim.cmd([[
  try
    colorscheme moonfly
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

-- Set the `MsgArea` highlight to the values of the normal group so it looks nicer
vim.api.nvim_set_hl(0, 'MsgArea', { fg = 'fg', bg = 'bg' })
