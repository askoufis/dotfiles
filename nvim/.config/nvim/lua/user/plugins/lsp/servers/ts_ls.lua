local lspconfig = require('lspconfig')
local common_on_attach = require('user.plugins.lsp.handlers').on_attach

lspconfig.ts_ls.setup {
  on_attach = common_on_attach { disable_formatting = true },
  settings = {
    ts_ls = {},
  },
}
