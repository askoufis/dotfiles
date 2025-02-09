local lspconfig = require('lspconfig')
local common_on_attach = require('user.plugins.lsp.handlers').on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Enables element and attribute competions
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  capabilities = capabilities,
  -- Let prettierd handle HTML formatting
  on_attach = common_on_attach { disable_formatting = true },
}
