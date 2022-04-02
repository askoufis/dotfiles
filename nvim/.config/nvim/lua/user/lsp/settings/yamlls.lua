local prequire = require("prequire")

return {
	settings = {
		yaml = {
			schemas = prequire("schemastore").json.schemas({
				select = {
					"Buildkite",
					"AWS CloudFormation",
				},
			}),
		},
	},
}
