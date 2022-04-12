local prequire = require('prequire')
local configs = prequire('nvim-treesitter.configs')

configs.setup {
  ensure_installed = {
    'css',
    'dockerfile',
    'fish',
    'html',
    'http',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'lua',
    'regex',
    'rust',
    'todo',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  }, -- either "all" or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { '' }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' }, -- list of languages to disable
    additional_vim_regex_highlighting = false,
  },
  -- indent is experimental
  indent = { enable = true, disable = { 'yaml' } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
