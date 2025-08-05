vim.lsp.config('html', {
  capabilities = {
    -- Let prettier handle formatting
    documentFormattingProvider = false,
    documentRangeFormattingProvider = false,
    textDocument = {
      completion = { completionItem = {
        snippetSupport = true,
      } },
    },
  },
})
