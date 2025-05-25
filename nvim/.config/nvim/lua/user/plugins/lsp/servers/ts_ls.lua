local common_on_attach = require('user.plugins.lsp.handlers').on_attach

vim.lsp.config('ts_ls', {
  on_attach = common_on_attach { disable_formatting = true },
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
