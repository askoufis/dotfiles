local ls = require('luasnip')

ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
}

require('luasnip.loaders.from_lua').load { paths = './lua/user/snippets' }
ls.filetype_extend('typescriptreact', { 'javascript', 'typescript' })
ls.filetype_extend('typescript', { 'javascript' })
