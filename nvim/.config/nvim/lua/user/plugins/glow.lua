return {
  -- markdown renderer
  'ellisonleao/glow.nvim',
  ft = 'markdown',
  keys = {
    { '<leader>mp', ':Glow<CR>', desc = 'Toggle Glow markdown preview', silent = true },
  },
  config = true,
  opts = {
    border = 'rounded',
    style = 'dark',
  },
}
