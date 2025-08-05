vim.lsp.config('lua_ls', {
  capabilities = {
    -- Let stylua handle formatting
    documentFormattingProvider = false,
    documentRangeFormattingProvider = false,
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          '${3rd}/luv/library',
          unpack(vim.api.nvim_get_runtime_file('', true)),
        },
        -- Don't really care that much about having a setup that matches my runtime
        -- since I'm not doing any serious lua dev at the moment
        -- https://github.com/LuaLS/lua-language-server/wiki/Settings#workspacecheckthirdparty
        checkThirdParty = false,
      },
      -- Enable Lua LSP's built-in snippets
      completion = {
        callSnippet = 'Replace',
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
