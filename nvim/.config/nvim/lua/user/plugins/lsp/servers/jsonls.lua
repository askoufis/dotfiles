local schemas = require('schemastore').json.schemas {
  select = {
    '.eslintrc',
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    'babelrc.json',
  },
}

-- Schema object from https://github.com/b0o/SchemaStore.nvim/blob/main/lua/schemastore/catalog.lua#L596
local nx_schema = {
  description = 'JSON schema for nx.json file',
  fileMatch = { 'nx.json' },
  url = 'https://raw.githubusercontent.com/nrwl/nx/master/packages/nx/schemas/nx-schema.json',
}

table.insert(schemas, nx_schema)

vim.lsp.config('jsonls', {
  settings = {
    json = {
      validate = { enable = true },
      schemas = schemas,
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
    -- Let prettier handle formatting
    documentFormattingProvider = false,
    documentRangeFormattingProvider = false,
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  },
})
