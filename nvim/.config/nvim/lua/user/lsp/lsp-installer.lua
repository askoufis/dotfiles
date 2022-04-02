local prequire = require('prequire')
local lsp_installer = prequire('nvim-lsp-installer')

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local options = {
    on_attach = require('user.lsp.handlers').on_attach,
    capabilites = require('user.lsp.handlers').capabilites,
  }

  if server.name == 'jsonls' then
    local jsonls_options = require('user.lsp.settings.jsonls')
    options = vim.tbl_deep_extend('force', jsonls_options, options)
  end

  if server.name == 'sumneko_lua' then
    local sumneko_lua_options = require('user.lsp.settings.sumneko_lua')
    options = vim.tbl_deep_extend('force', sumneko_lua_options, options)
  end

  if server.name == 'yamlls' then
    local yamlls_options = require('user.lsp.settings.yamlls')
    options = vim.tbl_deep_extend('force', yamlls_options, options)
  end

  if server.name == 'tsserver' then
    local tsserver_options = require('user.lsp.settings.tsserver')
    options = vim.tbl_deep_extend('force', tsserver_options, options)
  end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(options)
end)
