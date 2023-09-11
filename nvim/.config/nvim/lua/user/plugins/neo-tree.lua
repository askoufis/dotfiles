return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
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
      git_status = {
        symbols = {
          -- Change type
          -- Make these empty as `use_git_status_colors` is true by default, so the symbols
          -- provide redundant information
          added = '',
          modified = '',
          deleted = '✖', -- this can only be used in the git_status source
          renamed = '󰁕', -- this can only be used in the git_status source
        },
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = { '.git' },
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
    mappings = {
      ['s'] = 'open_split',
      ['v'] = 'open_vsplit',
    },
  },
}
