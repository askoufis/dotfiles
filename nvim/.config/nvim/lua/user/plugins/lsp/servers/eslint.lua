local common_on_attach = require('user.plugins.lsp.handlers').on_attach

vim.lsp.config('eslint', {
  -- Conform handles eslint fixes with eslint_d
  on_attach = common_on_attach { disable_formatting = true },
  settings = {
    eslint = {
      settings = {
        packageManager = 'pnpm',
      },
    },
  },
})
