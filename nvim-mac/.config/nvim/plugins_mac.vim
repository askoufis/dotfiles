source $HOME/.config/nvim/plugin_bootstrap.vim

" vim-plug config
call plug#begin(stdpath('data') . '/plugged')

" UI
Plug 'hoob3rt/lualine.nvim'
Plug 'bluz71/vim-moonfly-colors'

" Functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmsvg/pear-tree'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'neovim/nvim-lspconfig'

" Other
" Plug 'dstein64/vim-startuptime'

call plug#end()

" moonfly config
let g:moonflyItalics = 0

" lualine config
lua require('lualine').setup({options = {icons_enabled = false, theme = 'moonfly'}})

