local load_snippets = function()
  local ls = require('luasnip')
  require('luasnip.loaders.from_lua').load { paths = './lua/user/snippets' }
  ls.filetype_extend('typescriptreact', { 'javascript', 'typescript' })
  ls.filetype_extend('typescript', { 'javascript' })
end

return {
  'L3MON4D3/LuaSnip', -- snippet engine
  event = 'InsertEnter',
  keys = {
    {
      '<leader><leader>s',
      function()
        load_snippets()
        print('Snippets reloaded')
      end,
      desc = 'Reload all snippets',
    },
  },
  config = function(_, opts)
    local ls = require('luasnip')
    ls.setup(opts)

    load_snippets()
  end,
  opts = {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    region_check_events = 'InsertEnter',
    delete_check_events = 'TextChanged,InsertLeave',
  },
}
