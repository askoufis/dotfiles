local treesitter_configs = require('nvim-treesitter.configs')

treesitter_configs.setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
