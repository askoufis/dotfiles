return {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  init = function()
    vim.g.nvim_surround_no_visual_mappings = true
    vim.g.nvim_surround_no_normal_mappings = true

    -- Defaults to 'S' but I prefer 's'
    -- https://github.com/kylechui/nvim-surround/blob/ce4ad4a8909d7f4537803c8f09b79e78c49a6cc4/doc/nvim-surround.txt#L325-L327
    vim.keymap.set('x', 's', '<Plug>(nvim-surround-visual)', {
      desc = 'Add a surrounding pair around a motion',
    })

    -- Re-configure disabled defaults that I like
    -- https://github.com/kylechui/nvim-surround/blob/ce4ad4a8909d7f4537803c8f09b79e78c49a6cc4/doc/nvim-surround.txt#L331-L336
    vim.keymap.set('n', 'ds', '<Plug>(nvim-surround-delete)', {
      desc = 'Delete a surrounding pair',
    })
    vim.keymap.set('n', 'cs', '<Plug>(nvim-surround-change)', {
      desc = 'Change a surrounding pair',
    })
  end,
}
