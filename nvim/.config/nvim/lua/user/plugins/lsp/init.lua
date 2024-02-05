return {
  {
    'williamboman/mason.nvim', -- Package manager
    version = '*',
    cmd = 'Mason',
    config = true,
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
        },
      },
      ensure_installed = {
        'stylua',
        'prettierd',
      },
    },
  },
  { 'neovim/nvim-lspconfig' },
  {
    'williamboman/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'b0o/schemastore.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = {
      ensure_installed = { 'lua_ls', 'eslint', 'html', 'jsonls', 'tsserver', 'yamlls', 'cssls', 'astro', 'zls' },
    },
    config = function(_, opts)
      local masonLspconfig = require('mason-lspconfig')
      masonLspconfig.setup(opts)

      local lspconfig = require('lspconfig')

      lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
        capabilities = require('user.plugins.lsp.handlers').capabilites,
      })

      require('user.plugins.lsp.handlers').setup()

      -- LSP Server setup
      require('user.plugins.lsp.servers.eslint')
      require('user.plugins.lsp.servers.html')
      require('user.plugins.lsp.servers.jsonls')
      require('user.plugins.lsp.servers.lua_ls')
      require('user.plugins.lsp.servers.tsserver')
      require('user.plugins.lsp.servers.yamlls')
      require('user.plugins.lsp.servers.cssls')
      require('user.plugins.lsp.servers.astro')
      require('user.plugins.lsp.servers.rust_analyzer')
      require('user.plugins.lsp.servers.markdoc')
      require('user.plugins.lsp.servers.zls')
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
    -- This is a copy of the Neo-tree lazy keymap. We copy it so both plugins load when the keymap
    -- is pressed.
    keys = {
      {
        '\\',
        ':Neotree toggle<CR>',
        desc = 'Toggle NeoTree',
        silent = true,
      },
    },
  },
}
