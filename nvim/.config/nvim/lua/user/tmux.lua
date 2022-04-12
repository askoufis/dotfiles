local prequire = require('prequire')
local tmux = prequire('tmux')

tmux.setup {
  navigation = {
    -- cycles to opposite pane while navigating into the border
    -- cycle_navigation = true,
    -- enables default keybindings (C-hjkl) for normal mode
    enable_default_keybindings = true,
    -- don't break zoom when changing panes
    -- persist_zoom = true,
  },
}
