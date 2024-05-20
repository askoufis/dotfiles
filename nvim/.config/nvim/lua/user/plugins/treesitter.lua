return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function(_, opts)
      vim.filetype.add {
        extension = {
          mdoc = 'markdoc',
        },
      }

      -- markdoc configuration from https://github.com/markdoc-extra/tree-sitter-markdoc/tree/fe933e7737d5c97404b03d0979f63b45049d20a7
      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.markdoc = {
        install_info = {
          url = 'https://github.com/markdoc-extra/tree-sitter-markdoc',
          files = { 'src/parser.c' },
          branch = 'main',
        },
        filetype = 'markdoc',
      }

      require('nvim-treesitter.configs').setup(opts)

      vim.treesitter.language.register('markdown', 'mdx')
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
        'markdoc',
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
