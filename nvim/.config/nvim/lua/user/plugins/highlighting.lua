return {
  { 'baskerville/vim-sxhkdrc', ft = 'sxhkdrc' },
  {
    'chr4/nginx.vim',
    ft = 'nginx',
    keys = {
      -- Set filetype to nginx in-case the plugin doesn't detect the filetype correctly
      {
        '<leader>r',
        ':set ft=nginx<CR>',
        desc = 'Set filetype to nginx',
        silent = true,
      },
    },
  },
}
