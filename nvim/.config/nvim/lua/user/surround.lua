local nvim_surround = require('nvim-surround')

nvim_surround.setup {
  keymaps = {
    -- Usually it's `S`, but I find using `s` for both normal and visual mode feels more natural
    visual = 's',
  },
}
