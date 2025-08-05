vim.lsp.config('cssls', {
  capabilities = {
    -- Let prettier handle formatting
    documentFormattingProvider = false,
    documentRangeFormattingProvider = false,
  },
})
