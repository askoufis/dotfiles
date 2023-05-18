local lspconfig = require('lspconfig')
local common_on_attach = require('user.plugins.lsp.handlers').on_attach

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

lspconfig.jsonls.setup {
  on_attach = common_on_attach { disable_formatting = true },
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
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  },
}
