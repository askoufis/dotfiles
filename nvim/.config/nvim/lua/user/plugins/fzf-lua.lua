return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  opts = {
    defaults = {
      git_icons = false,
      file_icons = false,
    },
    previewers = {
      bat = {
        args = '--color=always --style=numbers,changes,grid',
      },
    },
    winopts = {
      preview = {
        default = 'bat',
      },
    },
    keymap = {
      fzf = {
        ['ctrl-k'] = 'ignore',
        ['ctrl-j'] = 'ignore',
        ['alt-j'] = 'down',
        ['alt-k'] = 'up',
        -- Put all results into a quickfix list
        ['ctrl-q'] = 'select-all+accept',
      },
    },
    grep = {
      rg_opts = [[ --column --line-number --ignore-case --glob '!package-lock.json' --glob '!yarn.lock' --glob '!pnpm-lock.yaml' ]],
    },
    lsp = {
      code_actions = {
        previewer = false,
      },
    },
  },
  config = function(_, opts)
    local fzf_lua = require('fzf-lua')
    fzf_lua.setup(opts)
    fzf_lua.register_ui_select()

    set_keymap('n', '<C-p>', fzf_lua.files, { desc = 'Project files' })

    set_keymap('n', '<leader>g', fzf_lua.live_grep, { desc = 'Grep with optional glob filter after --' })
    set_keymap('n', '<leader>ca', function()
      P("Use default 'gra' instead")
    end, { desc = 'Code actions' })

    set_keymap('n', '<leader>he', ':FzfLua helptags<CR>', { desc = 'Help tags' })
  end,
}
