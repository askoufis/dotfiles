local lspconfig = require('lspconfig')
local common_on_attach = require('user.plugins.lsp.handlers').on_attach

lspconfig.astro.setup {
  on_attach = common_on_attach { disable_formatting = false },
}
