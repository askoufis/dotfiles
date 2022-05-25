local prequire = require('prequire')
local ls = prequire('luasnip')

ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
}

prequire('luasnip.loaders.from_lua').load { paths = './lua/user/snippets' }
ls.filetype_extend('typescriptreact', { 'typescript' })
