local lspconfig = require('lspconfig')
local common_on_attach = require('user.lsp.handlers').on_attach

lspconfig.cssls.setup {
  on_attach = common_on_attach { disable_formatting = true },
}
