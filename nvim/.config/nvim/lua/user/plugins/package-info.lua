return {
  {
    'vuki656/package-info.nvim',
    event = 'BufEnter package.json',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      set_keymap('n', '<Leader>cpt', require('package-info').toggle, { silent = true, desc = 'Toggle' })
      set_keymap('n', '<Leader>cpu', require('package-info').update, { silent = true, desc = 'Update package' })
      set_keymap('n', '<Leader>cpd', require('package-info').delete, { silent = true, desc = 'Delete package' })
      set_keymap('n', '<Leader>cpi', require('package-info').install, { silent = true, desc = 'Install package' })
      set_keymap(
        'n',
        '<Leader>cpc',
        require('package-info').change_version,
        { silent = true, desc = 'Change package version' }
      )

      require('package-info').setup {
        package_manager = 'pnpm',
        hide_up_to_date = true,
      }
    end,
  },
}
