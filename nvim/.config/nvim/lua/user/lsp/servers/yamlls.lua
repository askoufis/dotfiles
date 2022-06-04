local lspconfig = require('lspconfig')
local common_on_attach = require('user.lsp.handlers').on_attach

lspconfig.yamlls.setup {
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
}
