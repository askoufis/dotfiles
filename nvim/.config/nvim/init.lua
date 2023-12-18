require('globals')
require('user.keymaps')
require('user.commands')
require('user.options')
require('user.autocommands')
require('user.buffer-deletion')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

-- Plugin specs are defined in the plugins module
lazy.setup({ import = 'user.plugins' }, { ui = { border = 'rounded' } })
