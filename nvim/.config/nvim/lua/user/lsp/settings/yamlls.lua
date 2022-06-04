return {
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
