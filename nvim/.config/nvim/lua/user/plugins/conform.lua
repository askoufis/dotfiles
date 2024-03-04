local prettierd = { 'prettierd' }

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
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      css = { prettierd },
      graphql = { prettierd },
      javascript = { prettierd },
      javasriptreact = { prettierd },
      json = { prettierd },
      jsonc = { prettierd },
      less = { prettierd },
      markdown = { prettierd },
      typescript = { prettierd },
      typescriptreact = { prettierd },
      yaml = { prettierd },
    },
    -- Set up format-on-save
    format_on_save = { notify_on_error = false, timeout_ms = 500, lsp_fallback = true },
  },
}
