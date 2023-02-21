return {
  'bluz71/vim-moonfly-colors',
  -- make sure we load this during startup if it is your main colorscheme
  lazy = false,
  -- make sure to load this before all the other start plugins
  priority = 1000,
  config = function()
    -- load the colorscheme here
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
  end,
}
