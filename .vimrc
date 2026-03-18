set number
set relativenumber
set cursorline
set showmatch
set signcolumn=yes
set scrolloff=8
set laststatus=2
set mouse=a

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set hidden
set noswapfile
set noshowmode
set nocompatible
set shortmess+=I
set encoding=utf-8
set clipboard=unnamedplus

call plug#begin('~/.vim/plugins')

    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'

    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'

    " TODO: Next, configure these plugins
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'easymotion/vim-easymotion'

    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'PhilRunninger/nerdtree-buffer-ops'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " TODO: Adding in installer 'coc-snippets'
    Plug 'sheerun/vim-polyglot'
    Plug 'honza/vim-snippets'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()
filetype plugin indent on

syntax on
set termguicolors
set background=dark
colorscheme onedark

" ============== [ Keymaps ] ============== "

let g:mapleader = ' '

nnoremap ; :

inoremap jk <ESC>
vnoremap jk <ESC>

nnoremap <leader>w <CMD>w!<CR>
nnoremap <leader>W <CMD>wa!<CR>
nnoremap <leader>q <CMD>q<CR>

nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==

vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

vnoremap < <gv
vnoremap > >gv

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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Right> :vertical resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <leader>bd :if len(getbufinfo({'buflisted':1})) > 1 <bar> bp <bar> bd# <bar> else <bar> enew <bar> bd# <bar> endif<CR>
nnoremap <leader>bD :bd!<CR>

nnoremap <leader>bo :%bd<bar>e#<bar>bd#<CR>
nnoremap <leader>br :.+1,$bd<CR>
nnoremap <leader>bl :1,.-1bd<CR>

" ============== [ Settings ] ============== "

" STARTIFY
let g:startify_custom_header = [
            \ '    _                                     _   ',
            \ '   | |_ _ _   ___ ___ ___ _____ _ _ _ ___| |_ ',
            \ '   | . | | |_|_ -| -_| . |     | | | | . | `_|',
            \ '   |___|_  |_|___|___|_  |_|_|_|_____|___|_,_|',
            \ '       |___|           |_|                    '
    \ ]


let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recent Files']            },
    \ { 'type': 'sessions',  'header': ['   Sessions']                },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']               },
    \ ]

let g:startify_bookmarks = [
    \ { 'c': '~/.vimrc' },
    \ { 'z': '~/.zshrc' },
    \ ]


" AIRLINE
let g:airline_powerline_fonts = 1

" Style buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_min_count = 2

" Style status line
let g:airline_section_x = ''
let g:airline_section_y = '%{WebDevIconsGetFileTypeSymbol()} %Y'
let g:airline_section_z = '%l : %c'
let g:airline_section_c = '%t %m'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0

" NERDTree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>E :NERDTreeFocus<CR>

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

