return {
  'TimUntersberger/neogit',
  dependencies = 'nvim-lua/plenary.nvim',
  cmd = 'Neogit',
  opts = {
    -- Always start in normal mode when committing
    disable_insert_on_commit = true,
  },
  keys = {
    { '<leader>G', ':Neogit<CR>', desc = 'Toggle Neogit', silent = true },
  },
}
