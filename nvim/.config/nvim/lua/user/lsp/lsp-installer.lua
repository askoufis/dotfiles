local prequire = require('prequire')
local lsp_installer = prequire('nvim-lsp-installer')

-- Use a table with keys to true so the lookup is easy
local clients_to_disable_formatting = { tsserver = true, jsonls = true, sumneko_lua = true }

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local common_on_attach = require('user.lsp.handlers').on_attach

  local options = {
    on_attach = common_on_attach,
    capabilites = require('user.lsp.handlers').capabilites,
  }

  options.on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      local lsp_formatting = vim.api.nvim_create_augroup('lsp_formatting', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        desc = 'Format the buffer on save',
        group = lsp_formatting,
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
      })
    end

    if server.name == 'eslint' then
      local eslint_fixall = vim.api.nvim_create_augroup('eslint_fixall', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
        desc = 'Fix all eslint problems on save',
        group = eslint_fixall,
        command = 'EslintFixAll',
      })
    end

    if clients_to_disable_formatting[server.name] then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end

    common_on_attach(client, bufnr)
  end

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

  if server.name == 'eslint' then
    local eslint_options = require('user.lsp.settings.eslint')
    options = vim.tbl_deep_extend('force', eslint_options, options)
  end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(options)
end)
