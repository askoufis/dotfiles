vim.lsp.config('yamlls', {
  -- capabilities = {
  --   -- Let prettier handle formatting
  --   documentFormattingProvider = false,
  --   documentRangeFormattingProvider = false,
  -- },
  settings = {
    yaml = {
      schemas = require('schemastore').json.schemas {
        select = {
          'Buildkite',
          'AWS CloudFormation',
        },
      },
    },
  },
})
