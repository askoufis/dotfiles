local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.prettierd,
    formatting.stylua,
  },
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        group = vim.api.nvim_create_augroup('null_ls_formatting', {}),
        desc = 'Format file before saving',
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
}
