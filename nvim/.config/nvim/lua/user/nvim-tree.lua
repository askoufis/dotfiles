local prequire = require('prequire')

-- Highlight folder and file names
vim.g.nvim_tree_highlight_opened_files = 2

-- Don't highlight special files
vim.g.nvim_tree_special_files = {}

-- Compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_group_empty = 1

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
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  hijack_cursor = true,
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
    width = '17%',
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
  git_hl = 1,
  root_folder_modifier = ':t',
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
}
