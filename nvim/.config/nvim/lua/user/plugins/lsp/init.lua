return {
  { 'neovim/nvim-lspconfig', lazy = true },
  {
    'mason-org/mason.nvim',
    version = '*',
    cmd = 'Mason',
    opts = {},
  },
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
        'astro',
        'cssls',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'mdx_analyzer',
        'oxlint',
        'rust_analyzer',
        'ts_ls',
        'yamlls',
        'zls',
      },
    },
    config = function(_, opts)
      local masonLspconfig = require('mason-lspconfig')
      masonLspconfig.setup(opts)

      -- LSP Server setup
      vim.lsp.enable('astro')
      require('user.plugins.lsp.servers.cssls')
      require('user.plugins.lsp.servers.eslint')
      require('user.plugins.lsp.servers.html')
      require('user.plugins.lsp.servers.jsonls')
      require('user.plugins.lsp.servers.lua_ls')
      vim.lsp.enable('mdx_analyzer')
      vim.lsp.enable('oxlint')
      vim.lsp.enable('rust_analyzer')
      require('user.plugins.lsp.servers.ts_ls')
      require('user.plugins.lsp.servers.yamlls')
      vim.lsp.enable('zls')
    end,
  },
}
