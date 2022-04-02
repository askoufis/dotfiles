local prequire = require('prequire')
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out the first time we require packer
local packer = prequire('packer')

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  -- Have packer manage itself
  use('wbthomason/packer.nvim')

  -- An implementation of the popup API from vim in neovim
  use('nvim-lua/popup.nvim')
  -- Useful lua functions used by a lot of plugins

  -- colorschemes
  use('bluz71/vim-moonfly-colors')

  use('windwp/nvim-autopairs') -- Autopairs, integrates with both cmp and treesitter

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use('JoosepAlviste/nvim-ts-context-commentstring') -- Context-aware comments via treesitter

  -- markdown renderer
  use {
    'ellisonleao/glow.nvim',
    cmd = 'Glow',
  }

  use {
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- cmp plugins
  use('hrsh7th/nvim-cmp') -- The completion plugin
  use('hrsh7th/cmp-buffer') -- buffer completions
  use('hrsh7th/cmp-path') -- path completions
  use('hrsh7th/cmp-cmdline') -- cmdline completions
  use('saadparwaiz1/cmp_luasnip') -- snippet completions
  use('hrsh7th/cmp-nvim-lsp') -- LSP completions
  use('hrsh7th/cmp-nvim-lua') -- nvim lua config completions

  -- snippets
  use('L3MON4D3/LuaSnip') -- snippet engine

  -- LSP
  use('neovim/nvim-lspconfig') -- Main LSP plugin
  use('williamboman/nvim-lsp-installer') -- Easy to use language server installer
  use('j-hui/fidget.nvim')
  use('jose-elias-alvarez/null-ls.nvim')

  -- JSON Schema
  use('b0o/schemastore.nvim')

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Comments
  use('numToStr/Comment.nvim') -- Comment stuff

  -- TMUX navigaion
  use {
    'aserowy/tmux.nvim',
    config = function()
      require('tmux').setup {
        navigation = {
          -- cycles to opposite pane while navigating into the border
          cycle_navigation = true,
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
      }
    end,
  }

  -- Git
  use('lewis6991/gitsigns.nvim')

  -- Surround
  use {
    'ur4ltz/surround.nvim',
    config = function()
      require('surround').setup { mappings_style = 'surround' }
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
