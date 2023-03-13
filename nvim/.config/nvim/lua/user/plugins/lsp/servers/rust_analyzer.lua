local lspconfig = require('lspconfig')
local common_on_attach = require('user.plugins.lsp.handlers').on_attach

local on_attach = function(client, bufnr)
  common_on_attach { disable_formatting = false }(client, bufnr)
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
}
