" Automatically install vim-plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug config
call plug#begin(stdpath('data') . '/plugged')

Plug 'dstein64/vim-startuptime'

" Original lualine repo
" Plug 'hoob3rt/lualine.nvim'
" Maintained fork of lualine while the maintainer is away
" from https://github.com/hoob3rt/lualine.nvim/pull/311
Plug 'shadmansaleh/lualine.nvim' 

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'neovim/nvim-lspconfig'
Plug 'tmsvg/pear-tree'

" Colours
Plug 'bluz71/vim-moonfly-colors'

" Rust
Plug 'simrat39/rust-tools.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

" Move to init.lua at some point
lua require('settings')
lua require('maps')

" --- Start plugin config
" initialise rust analyzer lsp
lua require('lspconfig').rust_analyzer.setup({})
let g:rustfmt_autosave = 1

" rust tools
lua require('rust-tools').setup({})
lua require('rust-tools.inlay_hints').set_inlay_hints({})
lua require('rust-tools.hover_range').hover_range()

" Loading telescope
lua require('telescope').setup()
lua require('telescope').load_extension('fzf')

" moonfly config
let g:moonflyItalics = 0

" lualine config
lua require('lualine').setup({options = {theme = 'moonfly'}})

" --- End plugin config

" enable syntax highlighting
syntax on

" make colours appear correctly with tmux + alacritty
" https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6#vim-neovim
set termguicolors
colorscheme moonfly

" Encoding
" Not sure if this can be moved to lua config yet
set encoding=utf-8

" Don't try to be vi compatible
" Apparently not needed for nvim
set nocompatible

" Bindings

" Telescope config
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
" nnoremap <leader>vh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>

" lsp config
nnoremap gh <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>

" Explorer config
let g:netrw_liststyle = 3

