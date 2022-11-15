local configs = require('nvim-treesitter.configs')

configs.setup {
  ensure_installed = {
    'comment',
    'css',
    'dockerfile',
    'fish',
    'html',
    'http',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'regex',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { 'yaml' } },
}
