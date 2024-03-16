return {
  'lukas-reineke/indent-blankline.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
      highlight = { 'MoonflyGrey18' },
    },
    scope = {
      enabled = false,
    },
  },
}
