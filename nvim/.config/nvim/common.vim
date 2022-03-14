" Move to init.lua at some point
lua require('settings')
lua require('maps')

" enable syntax highlighting
syntax on
filetype plugin indent on

" make colours appear correctly with tmux + alacritty
" https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6#vim-neovim
set termguicolors
colorscheme moonfly

" :w!!
" write to a file when you accidentally opened it without root privileges
cmap w!! w !sudo tee % > /dev/null

" Highlight last inserted text
" I never even use this map
nnoremap gV `[v`]

" Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" leader ev to open vimrc
nnoremap <leader>ev <cmd>vsplit $MYVIMRC<cr>

" leader sv to source vimrc
nnoremap <leader>sv <cmd>so $MYVIMRC<cr>

" Move to next buffer
nmap <leader>l <cmd>bnext<CR>

" Move to previous buffer
nmap <leader>h <cmd>bnext<CR>

" noh
nnoremap <Leader>n <cmd>noh<cr>

" globally replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" move lines around
nnoremap <leader>k <cmd>m-2<cr>==
nnoremap <leader>j <cmd>m+<cr>==
xnoremap <leader>k <cmd>m-2<cr>gv=gv
xnoremap <leader>j <cmd>m'>+<cr>gv=gv

" Allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SI = "\<Esc>]50;CursorShape=0\x7"
endif

" Encoding
" Not sure if this can be moved to lua config yet
set encoding=utf-8

" Don't try to be vi compatible
" Apparently not needed for nvim
set nocompatible

" lsp config
nnoremap gh <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
" too used to the hotkey from vscode
nnoremap <F2> <cmd>lua vim.lsp.buf.rename()<cr>

" General
set linebreak
" set showbreak=+++
set textwidth=100
set showmatch

" Searching
" Tabs and indentation
set cindent
set cino=(0

" Advanced
set t_Co=256
set undolevels=1000
set backspace=indent,eol,start
set encoding=utf-8
set wildmenu
set lazyredraw
set showcmd