local prequire = require('prequire')
local null_ls = prequire('null-ls')

local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.prettierd,
    formatting.stylua,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      local null_ls_formatting = vim.api.nvim_create_augroup('null_ls_formatting', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        group = null_ls_formatting,
        desc = 'Format file before saving',
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end,
}
