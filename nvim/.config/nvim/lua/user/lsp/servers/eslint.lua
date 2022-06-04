local lspconfig = require('lspconfig')
local common_on_attach = require('user.lsp.handlers').on_attach

local on_attach = function()
  common_on_attach { disable_formatting = false }()

  local eslint_fixall = vim.api.nvim_create_augroup('eslint_fixall', {})
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
    desc = 'Fix all eslint problems on save',
    group = eslint_fixall,
    command = 'EslintFixAll',
  })
end

lspconfig.eslint.setup {
  on_attach,
  settings = {
    eslint = {
      settings = {
        packageManager = 'yarn',
      },
    },
  },
}
