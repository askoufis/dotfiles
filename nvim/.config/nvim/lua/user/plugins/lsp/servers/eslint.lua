-- The default on_attach sets up the `LspEslintFixAll` command
-- This variable has to be declared outside `on_attach` otherwise
-- it ends up referring to this custom `on_attach` function, causing
-- a stack overflow.
local eslint_on_attach = vim.lsp.config.eslint.on_attach

local on_attach = function(client, bufnr)
  if eslint_on_attach ~= nil then
    eslint_on_attach(client, bufnr)
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.cjs', '*.mjs', '*.cts', '*.mts' },
    desc = 'Fix all eslint problems on save',
    group = vim.api.nvim_create_augroup('eslint_fixall', {}),
    command = 'LspEslintFixAll',
  })
end

vim.lsp.config('eslint', {
  on_attach = on_attach,
  settings = {
    eslint = {
      settings = {
        packageManager = 'pnpm',
      },
    },
  },
})
