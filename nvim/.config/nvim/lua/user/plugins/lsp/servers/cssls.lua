local common_on_attach = require('user.plugins.lsp.handlers').on_attach

vim.lsp.config('cssls', {
  on_attach = common_on_attach { disable_formatting = true },
})
