local prequire = require('prequire')
local toggleterm = prequire('toggleterm')

toggleterm.setup {
  size = function(term)
    return 16
  end,
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  shell = vim.o.shell,
}
