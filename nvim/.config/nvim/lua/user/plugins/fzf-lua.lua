return {
  'ibhagwan/fzf-lua',
  lazy = false,
  opts = {
    fzf_opts = {
      ['--bind'] = 'alt-k:up,alt-j:down',
    },
    winopts = {
      preview = {
        default = 'bat',
      },
    },
    defaults = {
      git_icons = false,
      file_icons = false,
    },
    grep = {
      rg_opts = [[ --glob '!package-lock.json' --glob '!yarn.lock' --glob '!pnpm-lock.yaml' ]],
    },
  },
  keys = function()
    local fzf_lua = require('fzf-lua')
    return {
      { '<C-p>', fzf_lua.files, desc = 'Project files' },
      { '<leader>g', fzf_lua.grep_project, desc = 'Grep through project files' },
    }
  end,
}
