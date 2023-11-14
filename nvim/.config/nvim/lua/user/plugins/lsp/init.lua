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
      require('user.plugins.lsp.servers.markdoc')
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
            local bufnr = vim.api.nvim_get_current_buf()

            local map = function(mode, l, r, opts)
              opts = opts or { silent = true }
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            map('n', '<leader>f', function()
              vim.lsp.buf.format { async = true }
            end)

            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              group = vim.api.nvim_create_augroup('null_ls_formatting_buf_' .. bufnr, {}),
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
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}
