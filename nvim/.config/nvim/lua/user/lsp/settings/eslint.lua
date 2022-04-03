return {
  settings = {
    eslint = {
      settings = {
        packageManager = 'yarn',
        -- codeActionOnSave = {
        --   enable = 'true',
        -- },
        -- format = true,
      },
      -- on_attach = function(client, bufnr)
      --   -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
      --   -- the resolved capabilities of the eslint server ourselves!
      --   vim.notify('Henlo')
      --   -- client.resolved_capabilities.document_formatting = true
      --   -- vim.cmd([[
      --   --   augroup EslintFixAll
      --   --     autocmd!
      --   --     autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
      --   --   augroup END
      --   -- ]])
      -- end,
    },
  },
}
