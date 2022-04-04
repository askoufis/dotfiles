local prequire = require('prequire')
local indent_blankline = prequire('indent_blankline')

vim.cmd [[highlight IndentBlanklineContextChar guifg=#626262 gui=nocombine]] -- MoonflyGrey241

indent_blankline.setup {
  char = '▏',
  show_current_context = true,
  show_current_context_start = false,
}
