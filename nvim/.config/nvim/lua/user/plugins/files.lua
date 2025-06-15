return {
  'echasnovski/mini.files',
  version = false,
  event = 'VeryLazy',
  config = function(_, opts)
    require('mini.files').setup(opts)

    local minifiles_toggle = function(o)
      if not MiniFiles.close() then
        MiniFiles.open(o)
      end
    end

    vim.keymap.set({ 'n', 'x' }, '\\', function()
      minifiles_toggle(vim.api.nvim_buf_get_name(0))
    end, { desc = 'Toggle MiniFiles in current buffer directory', silent = true })

    vim.keymap.set({ 'n', 'x' }, '|', minifiles_toggle, {
      desc = 'Toggle MiniFiles in current working directory',
      silent = true,
    })
  end,
  dependencies = { 'echasnovski/mini.icons' },
}
