local lspconfig = require('lspconfig')
local common_on_attach = require('user.lsp.handlers').on_attach

lspconfig.jsonls.setup {
  on_attach = common_on_attach { disable_formatting = true },
  settings = {
    json = {
      validate = { enable = true },
      schemas = require('schemastore').json.schemas {
        select = {
          'package.json',
          'tsconfig.json',
        },
      },
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
        end,
      },
    },
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  },
}
