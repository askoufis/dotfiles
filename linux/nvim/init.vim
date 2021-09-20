" Automatically install vim-plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug config
call plug#begin(stdpath('data') . '/plugged')
Plug 'tanvirtin/monokai.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/tokyonight-vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

" initialise rust analyzer lsp
lua require'lspconfig'.rust_analyzer.setup({})

" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tokyonight'
set termguicolors

" map leader to space
let mapleader=" "

" enable syntax highlighting
syntax on

" make colours appear correctly with tmux + alacritty
" https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6#vim-neovim
set termguicolors
colorscheme tokyonight

" tokyonight settings
let g:tokyonight_style = 'night'
let g:tokyonight_disable_italic_comment = 1
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" Security
set modelines=0

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Add angle brackets to % jump pairs
set matchpairs+=<:>

" Don't try to be vi compatible
set nocompatible

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" relative line numbers
set number
set relativenumber

" set cursorline
set linebreak
set showmatch

" leader ev to open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" leader sv to source vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>

" leader sp to source vimrc and run PlugInstall
nnoremap <leader>sp :so $MYVIMRC<cr>:PlugInstall<cr>

" Insert a new line below the current line without entering insert mode
nmap <CR> o<Esc>

" Remap f1 to escape so it doesn't open help
map <F1> <Esc>
imap <F1> <Esc>

" Tabs and indentation
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set smarttab
set softtabstop=4
set cindent
set cino=(0

" keep abandoned buffers around
set hidden

" don't persist highlights after searching
set nohlsearch

" Splits
set splitbelow
set splitright

" Searching
set hlsearch
set smartcase
" case insensitive search
set ignorecase

" highlight matching searches as you type
set incsearch

" scroll when the cursor is 8 lines from the top/bottom of the screen
set scrolloff=8

" always show the column to the left of the line numbers so it doesn't pop in
" and out as you save
set signcolumn=yes
