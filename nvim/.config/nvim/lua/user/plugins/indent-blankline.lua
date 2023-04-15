return {
  -- Indent highlighting
  'lukas-reineke/indent-blankline.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function(_, opts)
    require('indent_blankline').setup(opts)
    vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { link = 'MoonflyGrey241' })
  end,
  opts = {
    char = '▏',
    context_char = '▏',
    show_current_context = true,
    show_current_context_start = false,
  },
}
