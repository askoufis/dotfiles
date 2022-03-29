local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out the first time we require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Use a protected call so we don't error out on the first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Failed to require 'packer'")
  return
end

return packer.startup(function()
  -- Have packer manage itself
  use 'wbthomason/packer.nvim'
  use 'bluz71/vim-moonfly-colors'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'ellisonleao/glow.nvim',
    -- Install the glow binary when the plugin is installed
    run = ':GlowInstall',
    cmd = 'Glow'
  }

  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'christoomey/vim-tmux-navigator'
  use 'tmsvg/pear-tree'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
