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
    window = {
      position = 'right',
    },
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
      window = {
        mappings = {
          ['R'] = 'grug_far_replace',
        },
      },
    },
    commands = {
      -- Copied from https://github.com/MagicDuck/grug-far.nvim/blob/f47594f05d10b0bedfc0ed78e488e7fd714d57be/README.md#add-nvim-tree-integration-to-open-search-limited-to-focused-directory-or-file
      grug_far_replace = function(state)
        local node = state.tree:get_node()
        local prefills = {
          -- get the current path and get the parent directory if a file is selected
          paths = node.type == 'directory' and node:get_id() or vim.fn.fnamemodify(node:get_id(), ':h'),
        }

        local grug_far = require('grug-far')
        -- instance check
        if not grug_far.has_instance('explorer') then
          grug_far.open {
            instanceName = 'explorer',
            prefills = prefills,
            staticTitle = 'Find and Replace from Explorer',
          }
        else
          grug_far.open_instance('explorer')
          -- updating the prefills without clearing the search and other fields
          grug_far.update_instance_prefills('explorer', prefills, false)
        end
      end,
    },
    mappings = {
      ['s'] = 'open_split',
      ['v'] = 'open_vsplit',
    },
  },
}
