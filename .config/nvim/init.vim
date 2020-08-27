" Use vim-plug as plugin manager
call plug#begin('~/.local/share/nvim/plugged')
" Autocompletion engine
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug ins for deplete
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/context_filetype.vim'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Formatting
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'fisadev/vim-isort'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Git markers
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Folding support
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
" Vim wiki for notes and markdown highlighting
Plug 'vimwiki/vimwiki'
" Goyo for focus mode
Plug 'junegunn/goyo.vim'
" Some icon support
Plug 'ryanoasis/vim-devicons'
" List of Todos etc
Plug 'fisadev/FixedTaskList.vim'
call plug#end()
" === PLUGIN SETTINGS === 
" deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
call deoplete#custom#option('ignore_sources', {
   \ '_': ['around', 'buffer', 'tag']
   \ })
" Ultisnips
let g:UltiSnipsExpandTrigger='<c-Space>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
" set airline theme
let g:airline_theme='deus' "let g:airline_theme='deus'
" Neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
map <leader>w :Neoformat
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
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
" Signify
let g:signify_vcs_list = ['git']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
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
" pandoc presentations
map <leader>p :!pandoc % -t beamer -o %:r.pdf<CR>
" pandoc quick convert markdown
map <leader>r :!readnote % <CR>
