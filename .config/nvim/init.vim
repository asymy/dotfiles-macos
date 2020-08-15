" Use vim-plug as plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'fisadev/FixedTaskList.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'fisadev/vim-isort'
Plug 'neomake/neomake'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'ap/vim-css-color'
call plug#end()
" === PLUGIN SETTINGS === 
" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
" Tab through autocomplete options
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = 'right'
" set airline theme
let g:airline_theme='deus' "let g:airline_theme='deus'
" Neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'
" show pending tasks list
map <leader>t :TaskList<CR>
" folding plugin settings
let g:SimpylFold_docstring_preview = 1
" Latex settings
let g:tex_flavor = 'latex'
" === VIM SETTINGS ===
" leader
let mapleader=","
" fancy symbols
let fancy_symbols_enabled = 1
" set clipboard to be shared
set clipboard+=unnamedplus
set nocompatible
filetype plugin on
filetype indent on
let g:tex_flavor='latex'
syntax on
set encoding=utf-8
set number relativenumber
set wildmode=longest,list,full
" set no auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" navigation between panes
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Save files as sudo when needed
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" Spellchecker
map <leader>o :setlocal spell! spelllang=en_gb<CR>
" Set default new windows to open below and to the right of current window
set splitbelow splitright
" remove vertical lines on window division
set fillchars+=vert:\
" set tabs for python
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>
" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
" goyo for focus mode
map <leader>f :Goyo<CR>
let g:goyo_width=100
" Folding
set nofoldenable

