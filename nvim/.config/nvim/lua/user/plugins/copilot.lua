return {
  'github/copilot.vim',
  version = '*',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set(
      'i',
      '<C-l>',
      'copilot#Accept("<CR>")',
      { silent = true, expr = true, noremap = true, replace_keycodes = false }
    )
    vim.g.copilot_no_tab_map = true
  end,
}
