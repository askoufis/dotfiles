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
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
    end
  end,
}
