local prettierd = { 'prettierd', 'prettier', stop_after_first = true }

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
      css = prettierd,
      graphql = prettierd,
      html = prettierd,
      javascript = prettierd,
      javasriptreact = prettierd,
      json = prettierd,
      jsonc = prettierd,
      json5 = prettierd,
      less = prettierd,
      markdown = prettierd,
      ['markdown.mdx'] = prettierd,
      typescript = prettierd,
      typescriptreact = prettierd,
      yaml = prettierd,
    },
    format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
    notify_on_error = false,
  },
}
