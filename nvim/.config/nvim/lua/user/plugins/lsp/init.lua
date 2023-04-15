return {
  {
    'williamboman/mason.nvim', -- Package manager
    cmd = 'Mason',
    config = true,
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
        },
      },
    },
  },
  { 'neovim/nvim-lspconfig' },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'b0o/schemastore.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = {
      ensure_installed = { 'lua_ls', 'eslint', 'html', 'jsonls', 'tsserver', 'yamlls', 'cssls', 'astro' },
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
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local null_ls = require('null-ls')
      local formatting = null_ls.builtins.formatting

      return {
        sources = {
          formatting.prettierd,
          formatting.stylua,
        },
        on_attach = function(client)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
              pattern = '*',
              group = vim.api.nvim_create_augroup('null_ls_formatting', {}),
              desc = 'Format file before saving',
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end
        end,
      }
    end,
  },
}
