set number
set relativenumber
set cursorline
set showmatch

set hlsearch
set incsearch
set ignorecase
set smartcase

set expandtab

set tabstop=4
set shiftwidth=4
set smarttab

set scrolloff=8
set mouse=a
set clipboard=unnamedplus
set noswapfile

set encoding=utf8
set history=500


call plug#begin()

	Plug 'morhetz/gruvbox'
	Plug 'ryanoasis/vim-devicons'
	Plug 'vim-airline/vim-airline'

	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'

call plug#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme gruvbox


" ============ [ KEYMAPS ] ============ "

let g:mapleader = ' '

" Command Mode & Esc

nnoremap ; :

inoremap jk <ESC>
vnoremap jk <ESC>

" File Operations

nnoremap <leader>w <CMD>w<CR>
nnoremap <leader>q <CMD>q<CR>
nnoremap <leader>Q <CMD>qa!<CR>

" Line Manipulation

nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==

vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

vnoremap < <gv
vnoremap > >gv

" Navigation & Centering

nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz

nnoremap <silent> { {zz
nnoremap <silent> } }zz

nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" Windows Management

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Right> :vertical resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>

" ============ [ AIRLINE ] ============ "

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2

let g:airline#extensions#tabline#show_tab_type = 0

" ============ [ NERDTree ] ============ "

nnoremap <silent> <leader>e <CMD>NERDTreeToggle<CR>
nnoremap <silent> <leader>E <CMD>NERDTreeFocus<CR>

let NERDTreeMinimalUI = 1 
let NERDTreeShowHidden = 1

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ 'Modified'  :'',
	\ 'Staged'    :'',
	\ 'Untracked' :'',
	\ 'Renamed'   :'',
	\ 'Unmerged'  :'',
	\ 'Deleted'   :'',
	\ 'Dirty'     :'',
	\ 'Clean'     :'',
	\ 'Unknown'   :''
	\ }

" ============ [ AUTO-PAIRS ] ============ "

let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsCenterCursor = 1

