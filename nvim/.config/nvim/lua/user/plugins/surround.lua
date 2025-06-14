return {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  opts = {
    keymaps = {
      -- Usually it's `S`, but I find using `s` for both normal and visual mode feels more natural
      visual = 's',
    },
  },
}
