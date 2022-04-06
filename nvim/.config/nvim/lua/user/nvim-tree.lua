local prequire = require('prequire')
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
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
}

local nvim_tree = prequire('nvim-tree')

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      -- These first two seem annoying
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = { '^.git' },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 35,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
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
  quit_on_open = 0,
  git_hl = 1,
  disable_window_picker = 0,
  root_folder_modifier = ':t',
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
}
