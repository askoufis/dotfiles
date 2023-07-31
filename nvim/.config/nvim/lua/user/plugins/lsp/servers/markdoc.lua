local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.markdoc_ls then
  configs.markdoc_ls = {
    default_config = {
      -- Currently `markdoc-ls` is installed globally
      cmd = { 'markdoc-ls', '--stdio' },
      filetypes = { 'markdoc' },
      root_dir = function(fname)
        return lspconfig.util.find_package_json_ancestor(fname)
      end,
      settings = {},
    },
  }
end

local common_on_attach = require('user.plugins.lsp.handlers').on_attach

lspconfig.markdoc_ls.setup {
  on_attach = common_on_attach { disable_formatting = false },
}
