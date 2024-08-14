return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      -- Register markdown.mdx filetypes as markdown as there is currently no treesitter grammer for
      -- mdx
      vim.treesitter.language.register('markdown', 'markdown.mdx')
    end,
    opts = {
      ensure_installed = {
        'astro',
        'bash',
        'comment',
        'css',
        'dockerfile',
        'fish',
        'git_config',
        'git_rebase',
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
        'zig',
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
      },
      indent = { enable = true, disable = { 'yaml' } },
      -- Playground config
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { 'BufWrite', 'CursorHold' },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ['ap'] = '@parameter.outer',
            ['ip'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ii'] = '@conditional.inner',
            ['ai'] = '@conditional.outer',
            ['il'] = '@loop.inner',
            ['al'] = '@loop.outer',
            ['at'] = '@comment.outer',
          },
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPost', 'BufNewFile' },
  },
  {
    -- Visual mode selection powered by treesitter
    'gsuuon/tshjkl.nvim',
    config = true,
    event = 'BufEnter',
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
  },
}
