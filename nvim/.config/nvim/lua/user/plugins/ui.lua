return {
  -- icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- component library
  { 'MunifTanjim/nui.nvim', lazy = true },

  -- An implementation of the popup API from vim in neovim
  { 'nvim-lua/popup.nvim', lazy = true },

  -- LSP progress inidicator
  { 'j-hui/fidget.nvim', version = '*', event = 'BufAdd', config = true },
}
