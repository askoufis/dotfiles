local js = { 'prettierd' }

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      css = js,
      graphql = js,
      html = js,
      javascript = js,
      javasriptreact = js,
      json = js,
      jsonc = js,
      json5 = js,
      less = js,
      markdown = js,
      ['markdown.mdx'] = js,
      typescript = js,
      typescriptreact = js,
      yaml = js,
    },
    format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
    notify_on_error = true,
  },
}
