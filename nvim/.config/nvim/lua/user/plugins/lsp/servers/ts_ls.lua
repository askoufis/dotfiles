vim.lsp.config('ts_ls', {
  capabilities = {
    -- Let prettier handle formatting
    documentFormattingProvider = false,
    documentRangeFormattingProvider = false,
  },
})
