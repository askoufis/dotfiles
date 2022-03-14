source $HOME/.config/nvim/plugin_bootstrap.vim

" vim-plug config
call plug#begin(stdpath('data') . '/plugged')

Plug 'dstein64/vim-startuptime'

Plug 'nvim-lualine/lualine.nvim' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'neovim/nvim-lspconfig'
Plug 'tmsvg/pear-tree'
Plug 'DingDean/wgsl.vim'

" Colours
Plug 'bluz71/vim-moonfly-colors'

" Rust
Plug 'simrat39/rust-tools.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

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
lua require('lualine').setup({options = {icons_enabled = false, theme = 'moonfly'}})

" Telescope config
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
" nnoremap <leader>vh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
