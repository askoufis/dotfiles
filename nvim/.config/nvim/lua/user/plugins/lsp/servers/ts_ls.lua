vim.lsp.config('ts_ls', {
  capabilities = {
    -- Let prettier handle formatting
    documentFormattingProvider = false,
    documentRangeFormattingProvider = false,
  },
  settings = {
    ts_ls = {},
  },
  root_dir = function(bufnr, cb)
    local root =
      vim.fs.root(bufnr, { 'pnpm-lock.yaml', 'pnpm-workspace.yaml', 'yarn.lock', 'package-lock.json', '.git' })
    if root then
      cb(root)
    else
      P('Failed to find a suitable root directory for ts_ls')
    end
  end,
})
