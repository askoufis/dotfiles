return {
  'ibhagwan/fzf-lua',
  lazy = false,
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
  },
  keys = function()
    local fzf_lua = require('fzf-lua')
    return {
      { '<C-p>', fzf_lua.files, desc = 'Project files' },
      { '<leader>g', fzf_lua.live_grep_glob, desc = 'Grep with optional glob filter after --' },
    }
  end,
}
