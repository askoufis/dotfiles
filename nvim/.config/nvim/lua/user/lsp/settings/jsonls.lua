return {
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
