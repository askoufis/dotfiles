return {
  'aserowy/tmux.nvim',
  config = true,
  event = 'VeryLazy',
  opts = {
    navigation = {
      -- cycles to opposite pane while navigating into the border
      cycle_navigation = false,
      -- enables default keybindings (C-hjkl) for normal mode
      -- I don't think it's possible to lazily load this plugin off a keybind
      enable_default_keybindings = true,
      -- don't break zoom when changing panes
      persist_zoom = true,
    },
    copy_sync = {
      enable = false,
    },
    resize = {
      enable_default_keybindings = false,
    },
    swap = {
      enable_default_keybindings = false,
    },
  },
}
