local prequire = require('prequire')
local null_ls = prequire('null-ls')

local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.prettierd,
    formatting.stylua,
  },
}
