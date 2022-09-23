local tmux = require('tmux')

tmux.setup {
  navigation = {
    -- cycles to opposite pane while navigating into the border
    cycle_navigation = false,
    -- enables default keybindings (C-hjkl) for normal mode
    enable_default_keybindings = true,
    -- don't break zoom when changing panes
    persist_zoom = true,
  },
  resize = {
    enable_default_keybindings = false,
  },
}
