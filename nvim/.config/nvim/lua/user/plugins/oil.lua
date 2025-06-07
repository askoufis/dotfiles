return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == '.git'
      end,
    },
    delete_to_trash = true,
    float = {
      padding = 2,
      max_width = 0.8,
      max_height = 0.8,
      border = 'rounded',
    },
  },
  dependencies = { 'echasnovski/mini.icons' },
  config = true,
  keys = {
    {
      '\\',
      "<CMD>lua require('oil').toggle_float()<CR>",
      { 'n', 'x' },
      desc = 'Toggle Oil floating buffer',
      silent = true,
    },
  },
}
