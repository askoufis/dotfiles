local lsp_installer = require('nvim-lsp-installer')

lsp_installer.setup {}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  capabilities = require('user.lsp.handlers').capabilites,
})
