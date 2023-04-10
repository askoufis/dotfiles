return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
    opts = {
      ensure_installed = {
        'comment',
        'css',
        'dockerfile',
        'fish',
        'html',
        'http',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'lua',
        'markdown',
        'markdown_inline',
        'regex',
        'rust',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      indent = { enable = true, disable = { 'yaml' } },
    },
  },
  {
    -- Context-aware comments via treesitter
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
  },
}
