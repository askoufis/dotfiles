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

-- Use a protected call so we don't error out the first time we require packer
local packer = prequire('packer')

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  group = vim.api.nvim_create_augroup('packer_user_config', {}),
  desc = 'Reload plugins.lua and sync plugins when plugins.lua is saved',
  callback = function()
    -- Force unload this module so we can re-require it
    package.loaded['user.plugins'] = nil
    require('user.plugins')
    packer.sync()
  end,
})
-- Have packer use a popup window
packer.init {
  -- Just in case I get rate-limited by github
  -- max_jobs = 1,
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup {
  function(use)
    -- Have packer manage itself
    use('wbthomason/packer.nvim')

    -- An implementation of the popup API from vim in neovim
    use('nvim-lua/popup.nvim')

    -- colorschemes
    use('bluz71/vim-moonfly-colors')

    -- status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- File tree
    use {
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v2.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
      },
    }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Context-aware comments via treesitter
    use {
      'JoosepAlviste/nvim-ts-context-commentstring',
      event = 'BufAdd',
      config = "require('user.plugin-config.context-commentstring')",
    }

    -- Autopairs, integrates with both cmp and treesitter
    use { 'windwp/nvim-autopairs', event = 'InsertEnter', config = "require('user.plugin-config.autopairs')" }
    -- Autocomplete xml tags
    use { 'windwp/nvim-ts-autotag', event = 'InsertEnter', config = "require('user.plugin-config.autotag')" }

    -- markdown renderer
    use {
      'ellisonleao/glow.nvim',
      ft = 'markdown',
      config = "require('user.plugin-config.glow')",
    }

    use {
      'noib3/nvim-cokeline',
      requires = 'kyazdani42/nvim-web-devicons',
    }

    -- snippets
    use('L3MON4D3/LuaSnip') -- snippet engine

    -- cmp plugins
    use('hrsh7th/nvim-cmp') -- The completion plugin
    use('hrsh7th/cmp-buffer') -- buffer completions
    use('hrsh7th/cmp-path') -- path completions
    use('hrsh7th/cmp-cmdline') -- cmdline completions
    use('saadparwaiz1/cmp_luasnip') -- snippet completions
    use('hrsh7th/cmp-nvim-lsp') -- LSP completions
    use('hrsh7th/cmp-nvim-lua') -- nvim lua config completions

    -- LSP
    use('neovim/nvim-lspconfig') -- Main LSP plugin
    use('williamboman/mason.nvim') -- Package manager
    use('williamboman/mason-lspconfig.nvim') -- Language server mason plugin

    use { 'j-hui/fidget.nvim', event = 'BufAdd', config = "require('user.plugin-config.fidget')" }

    use('jose-elias-alvarez/null-ls.nvim')

    use { 'jayp0521/mason-null-ls.nvim' }

    -- JSON Schema
    use('b0o/schemastore.nvim')

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      branch = '0.1.x',
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Comments
    use {
      'numToStr/Comment.nvim',
      event = 'InsertEnter',
      config = "require('user.plugin-config.comment')",
      after = 'nvim-ts-context-commentstring',
    }

    -- TMUX navigaion
    use('aserowy/tmux.nvim')

    -- Git
    use('lewis6991/gitsigns.nvim')

    -- Surround
    use {
      'kylechui/nvim-surround',
      event = 'InsertEnter',
      config = "require('user.plugin-config.surround')",
    }

    -- Indent highlighting
    use {
      'lukas-reineke/indent-blankline.nvim',
      event = 'InsertEnter',
      config = "require('user.plugin-config.indent-blankline')",
    }

    -- For sxhkd highlighting
    use { 'baskerville/vim-sxhkdrc', ft = 'sxhkdrc' }

    -- Git
    use {
      'TimUntersberger/neogit',
      commit = '478d95d28229cd3e7ed49aeab903b3c77c1fc0e5',
      requires = 'nvim-lua/plenary.nvim',
      cmd = 'Neogit',
      config = "require('user.plugin-config.neogit')",
    }

    -- Improve startup time
    use('lewis6991/impatient.nvim')

    use { 'chr4/nginx.vim', ft = 'nginx' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
  end,
}
