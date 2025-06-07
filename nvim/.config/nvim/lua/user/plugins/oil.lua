local detail = false

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
    keymaps = {
      -- Copied from https://github.com/stevearc/oil.nvim/blob/08c2bce8b00fd780fb7999dbffdf7cd174e896fb/doc/recipes.md#toggle-file-detail-view
      ['gd'] = {
        desc = 'Toggle file detail view',
        callback = function()
          detail = not detail
          if detail then
            require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
          else
            require('oil').set_columns { 'icon' }
          end
        end,
      },
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
