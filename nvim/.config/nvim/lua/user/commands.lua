-- Bind :W to :w
vim.api.nvim_create_user_command('W', ':w', { nargs = 0 })
