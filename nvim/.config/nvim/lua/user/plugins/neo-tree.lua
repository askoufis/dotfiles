return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '\\',
      ':Neotree toggle<CR>',
      desc = 'Toggle NeoTree',
      silent = true,
    },
  },
  cmd = 'Neotree',
  init = function()
    -- remove the deprecated commands from v1.x
    vim.g.neo_tree_remove_legacy_commands = 1

    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = ' ', texthl = 'DiagnosticSignHint' })
  end,
  config = true,
  opts = {
    default_component_configs = {
      container = {
        enable_character_fade = false,
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '󰷏',
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = { '.git' },
      },
      follow_current_file = true,
    },
    git_status = {
      symbols = {
        -- Change type
        added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = '✖', -- this can only be used in the git_status source
        renamed = '󰁕', -- this can only be used in the git_status source
        -- Status type
        untracked = '',
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        conflict = '',
      },
    },
    mappings = {
      ['s'] = 'open_split',
      ['v'] = 'open_vsplit',
    },
  },
}
