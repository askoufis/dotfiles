return {
  'github/copilot.vim',
  version = '*',
  config = function()
    set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
    vim.g.copilot_no_tab_map = true
  end,
  event = 'VeryLazy',
}
