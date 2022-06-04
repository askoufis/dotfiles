s = function()
  vim.cmd('normal yiw')
  P(vim.api.nvim_win_get_cursor(0))
  vim.cmd('normal o')
  vim.cmd('normal aconsole.log({  })')
  vim.cmd('normal hhP')
end
