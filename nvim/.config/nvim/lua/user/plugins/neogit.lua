return {
  'TimUntersberger/neogit',
  dependencies = 'nvim-lua/plenary.nvim',
  cmd = 'Neogit',
  keys = {
    { '<leader>G', ':Neogit<CR>', desc = 'Toggle Neogit', silent = true },
  },
  config = true,
  opts = {
    auto_show_console = false,
  },
}
