local common_on_attach = require('user.plugins.lsp.handlers').on_attach

vim.lsp.config('yamlls', {
  on_attach = common_on_attach { disable_formatting = true },
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
