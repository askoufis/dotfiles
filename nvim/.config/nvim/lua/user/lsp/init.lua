local prequire = require('prequire')
prequire('lspconfig')

require('user.lsp.lsp-installer')
require('user.lsp.handlers').setup()
