local prequire = require('prequire')

local nvim_tree = prequire('nvim-tree')

nvim_tree.setup {
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  hijack_cursor = true,
  renderer = {
    highlight_opened_files = 'name',
    special_files = {},
    group_empty = true,
    highlight_git = true,
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = '',
          staged = 'S',
          unmerged = '',
          renamed = '➜',
          deleted = '',
          untracked = 'U',
          ignored = '◌',
        },
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      -- These first two seem annoying
      error = '',
      warning = '',
      hint = '',
      info = '',
    },
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$' },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = '20%',
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {
        -- https://github.com/kyazdani42/nvim-tree.lua#settings
        { key = { 'l', '<CR>', 'o' }, action = 'edit' },
        { key = 'h', action = 'close_node' },
        { key = 's', action = 'split' },
        { key = 'v', action = 'vsplit' },
      },
    },
    number = false,
    relativenumber = true,
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
}
