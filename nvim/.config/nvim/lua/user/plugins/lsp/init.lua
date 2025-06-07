return {
  {
    'mason-org/mason.nvim', -- Package manager
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
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason-org/mason.nvim',
      'b0o/schemastore.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'lua_ls',
        'eslint',
        'html',
        'jsonls',
        'ts_ls',
        'yamlls',
        'cssls',
        'astro',
        'zls',
        'mdx_analyzer',
      },
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
      require('user.plugins.lsp.servers.ts_ls')
      require('user.plugins.lsp.servers.yamlls')
      require('user.plugins.lsp.servers.cssls')
      require('user.plugins.lsp.servers.astro')
      require('user.plugins.lsp.servers.rust_analyzer')
      require('user.plugins.lsp.servers.zls')
      require('user.plugins.lsp.servers.mdx_analyzer')
    end,
  },
}
