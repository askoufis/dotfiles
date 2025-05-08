local common_on_attach = require('user.plugins.lsp.handlers').on_attach

local on_attach = function(client, bufnr)
  common_on_attach { disable_formatting = false }(client, bufnr)

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.cjs', '*.mjs' },
    desc = 'Fix all eslint problems on save',
    group = vim.api.nvim_create_augroup('eslint_fixall', {}),
    command = 'EslintFixAll',
  })
end

vim.lsp.config('eslint', {
  on_attach = on_attach,
  settings = {
    eslint = {
      settings = {
        packageManager = 'yarn',
      },
    },
  },
})
