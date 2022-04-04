local prequire = require('prequire')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  settings = {
    json = {
      schemas = prequire('schemastore').json.schemas {
        select = {
          'package.json',
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
  capabilities = capabilities,
}
