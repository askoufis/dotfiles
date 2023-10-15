return {
  'lukas-reineke/indent-blankline.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'ibl',
  opts = {
    debounce = 30,
    indent = {
      char = '▏',
    },
    scope = {
      show_start = false,
      highlight = { 'MoonflyGrey241' },
    },
  },
}
