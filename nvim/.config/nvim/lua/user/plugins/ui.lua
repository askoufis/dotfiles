return {
  -- icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- component library
  { 'MunifTanjim/nui.nvim', lazy = true },

  -- An implementation of the popup API from vim in neovim
  { 'nvim-lua/popup.nvim', lazy = true },

  -- LSP progress inidicator
  -- Plugin is being re-written, pinned to `legacy` tag to avoid breaking changes
  -- See https://github.com/j-hui/fidget.nvim/tree/f1c375ba68839eaa4a65efdf2aa078c0da0548fe#fidgetnvim
  { 'j-hui/fidget.nvim', tag = 'legacy', event = 'BufAdd', config = true },
}
