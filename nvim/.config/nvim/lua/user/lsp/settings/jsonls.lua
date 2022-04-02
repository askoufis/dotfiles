local prequire = require('prequire')

local opts = {
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
}

return opts
