" Move to init.lua at some point
lua require('options')
lua require('keymaps')

colorscheme moonfly

" :w!!
" write to a file when you accidentally opened it without root privileges
cmap w!! w !sudo tee % > /dev/null

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
