return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    ---@param opts TSConfig
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      vim.treesitter.language.register('markdown', 'mdx')
    end,
    ---@type TSConfig
    opts = {
      ensure_installed = {
        'astro',
        'bash',
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
        'query',
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
      -- Playground config
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { 'BufWrite', 'CursorHold' },
      },
    },
  },
  {
    -- Context-aware comments via treesitter
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
  },
  {
    'nvim-treesitter/playground',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    cmd = 'TSPlaygroundToggle',
    config = false,
  },
}
