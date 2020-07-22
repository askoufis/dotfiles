syntax on
let g:rehash256=1
colorscheme molokai
filetype plugin indent on

set spell spelllang=en_au
" Default spell checking to off
set nospell
" set guifont=Consolas:h11

" vim-plug
call plug#begin()
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" vim-airline
" github.com/powerline/fonts for prepatch fonts
set laststatus=2
set ttimeoutlen=50
let g:airline_powerline_fonts = 1

" vimtex options
let g:vimtex_latexmk_enabled = 0

" maps
" Remap leader to the spacebar
let mapleader = "\<Space>"

" Insert a new. line below the current line without entering insert mode
nmap <CR> o<Esc>

" :w!!
" write to a file when you accidentally opened it without root privileges
cmap w!! w !sudo tee % > /dev/null

" Highlight last inserted text
nnoremap gV `[v`]

" Moving vertically doesn't skip over wrapped lines
nnoremap j gj
nnoremap k gk

" Remap f1 to escape
map <F1> <Esc>
imap <F1> <Esc>

" Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" leader ev to open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" leader sv to source vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>

" Move to next buffer
nmap <leader>l :bnext<CR>

" Move to previous buffer
nmap <leader>h :bnext<CR>

" leader sp to toggle spell check
nmap <silent> <leader>sp :set spell!<CR>

" leader f to quick fix a spelling mistake
nnoremap <leader>f 1z=

" leader vc to execute vcvars all
" nnoremap <leader>vc :!call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64<CR>

" noh
nnoremap <Leader>n :noh<cr>

" Allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SI = "\<Esc>]50;CursorShape=0\x7"
endif

" So tabs are 2 spaces in yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" General
set number
set cursorline
set linebreak
" set showbreak=+++
set textwidth=100
set showmatch

" Searching
set hlsearch
set smartcase
set ignorecase
set incsearch

" Tabs and indentation
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set smarttab
set softtabstop=4
set cindent
set cino=(0

" Advanced
set ruler
set t_Co=256
set undolevels=1000
set backspace=indent,eol,start
set encoding=utf-8
set wildmenu
set lazyredraw
set showcmd

" Splits
set splitbelow
set splitright
