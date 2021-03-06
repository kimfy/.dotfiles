" Set clipboard to system clipboard (makes + and * registers useless.) Makes
" it possible to copy text between different nvim instances.
set clipboard+=unnamedplus
" Highlight the current line in all modes
set cursorline
" # This first section configures Neovim's default settings.
" Hybrid Relative Line Numbers <3
set number relativenumber

" Disable swapfiles
set noswapfile

" Remove key bindings for arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Set indentation to spaces and 2 in width
set tabstop=2
set shiftwidth=2
set expandtab

" "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" This seconds sectoin configures neovim's plugin sections
" Enable vim-plug and install plugins
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'neovim/nvim-lspconfig'
" telescope dependencies then main plugin
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
" Telescope plugin: Ctrl+p to search fr files
Plug 'nvim-telescope/telescope.nvim'

" DevOps Stuff
Plug 'hashivim/vim-terraform'

" The nicest theme EVER.
Plug 'ellisonleao/gruvbox.nvim'

Plug 'ellisonleao/glow.nvim'
" coq (fast as FUCK nvim completion)
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Dynamic register peeking. Source: https://github.com/gennaro-tedesco/nvim-peekup
Plug 'gennaro-tedesco/nvim-peekup'
" Create missing directories on save (mkdir -p). Source: https://github.com/jghauser/mkdir.nvim
Plug 'jghauser/mkdir.nvim'

" Another file-tree plugin. Supposedly good integration with barbar.nvim
Plug 'kyazdani42/nvim-tree.lua'
" THE tabline plugin for neovim. Source: https://github.com/romgrk/barbar.nvim#integration-with-filetree-plugins
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
call plug#end()

" coq, by default has an annoying autostart message. This shuts it.
let g:coq_settings = { 'auto_start': 'shut-up' }

" Theme
set background=dark
colorscheme gruvbox

" Telescope config
" set Ctrl+p to file browser
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

" DevOps stuff
let g:terraform_fmt_on_save=1 

lua <<EOF
  require'lspconfig'.terraformls.setup{} 
  require'lspconfig'.csharp_ls.setup{}
EOF
autocmd BufWritePre *.cs lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.tfvars lua vim.lsp.buf.formatting_sync()

" barbar.nvim configuration
" to enable clicking with barbar.vim
set mouse+=a
:lua require 'my-barbar'
:lua require 'my-nvim-tree'
