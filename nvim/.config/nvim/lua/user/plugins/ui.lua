return {
  -- icons
  {
    'echasnovski/mini.icons',
    version = false,

    config = function(_, opts)
      require('mini.icons').setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end,
    lazy = true,
  },

  -- component library
  { 'MunifTanjim/nui.nvim', lazy = true },

  -- LSP progress inidicator
  { 'j-hui/fidget.nvim', version = '*', event = 'BufAdd', config = true },
}
