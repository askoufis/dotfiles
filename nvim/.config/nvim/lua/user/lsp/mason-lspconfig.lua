local masonLspconfig = require('mason-lspconfig')

masonLspconfig.setup {
  ensure_installed = { 'lua_ls', 'eslint', 'html', 'jsonls', 'tsserver', 'yamlls' },
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  capabilities = require('user.lsp.handlers').capabilites,
})
