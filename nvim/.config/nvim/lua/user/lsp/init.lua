require('user.lsp.mason-lspconfig')
require('user.lsp.handlers').setup()
require('user.lsp.null-ls')
require('user.lsp.mason-null-ls')

-- LSP Server setup
require('user.lsp.servers.eslint')
require('user.lsp.servers.html')
require('user.lsp.servers.jsonls')
require('user.lsp.servers.lua_ls')
require('user.lsp.servers.tsserver')
require('user.lsp.servers.yamlls')
require('user.lsp.servers.cssls')
