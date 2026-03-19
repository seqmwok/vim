" Interface
set number
set relativenumber
set cursorline
set mouse=a
set scrolloff=8
set signcolumn=yes
set laststatus=2
set termguicolors
set shortmess+=I

" Indentation & Text
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set encoding=utf-8

" Search
set ignorecase
set smartcase
set incsearch

" System & Behavior
set hidden
set updatetime=100
set clipboard=unnamedplus
filetype plugin indent on
syntax on
set background=dark

" ============== [ Plugins ] ============== "
call plug#begin('~/.vim/plugins')
    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'

    " UI / Status
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
	
    " Search / Nav
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " Completion / LSP
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'honza/vim-snippets'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Editing
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'easymotion/vim-easymotion'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

colorscheme gruvbox

" ============== [ Keymaps ] ============== "
let g:mapleader = ' '

nnoremap ; :
inoremap jk <ESC>
vnoremap jk <ESC>

" Save/Quit
nnoremap <leader>w :w!<CR>
nnoremap <leader>W :wa!<CR>
nnoremap <leader>q :q<CR>

" Move Lines
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" Indent
vnoremap < <gv
vnoremap > >gv

" Navigation
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" Search Center
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> { {zz
nnoremap <silent> } }zz

" Windows management
nnoremap <leader>we <C-w>=
nnoremap <leader>wc :close<CR>
nnoremap <leader>wo :only<CR>

" Windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Windows resize
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Right> :vertical resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bd :if len(getbufinfo({'buflisted':1})) > 1 <bar> bp <bar> bd# <bar> else <bar> enew <bar> bd# <bar> endif<CR>
nnoremap <leader>bD :bd!<CR>
nnoremap <leader>bo :%bd<bar>e#<bar>bd#<CR>
nnoremap <leader>br :.+1,$bd<CR>
nnoremap <leader>bl :1,.-1bd<CR>

" ============== [ Plugin Config ] ============== "

" Startify
let g:startify_custom_header = [
    \ '    _                                     _   ',
    \ '   | |_ _ _   ___ ___ ___ _____ _ _ _ ___| |_ ',
    \ '   | . | | |_|_ -| -_| . |     | | | | . | `_|',
    \ '   |___|_  |_|___|___|_  |_|_|_|_____|___|_,_|',
    \ '       |___|           |_|                    ']

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recent Files'] },
    \ { 'type': 'sessions',  'header': ['   Sessions'] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] }]

let g:startify_bookmarks = [ { 'c': '~/.vimrc' }, { 'z': '~/.zshrc' } ]

" Airline
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_min_count = 2

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#gitgutter#enabled = 1
let g:airline#extensions#fugitive#enabled = 1

let g:airline_section_b = '%{FugitiveHead()} %{coc#status()}'
let g:airline_section_c = '%F %m'
let g:airline_section_x = '%{strlen(&filetype) ? &filetype : ""}'
let g:airline_section_z = '%l : %c'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0


" FZF
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fh :History<CR>

let g:fzf_preview_window = []
let $FZF_DEFAULT_OPTS='--layout=reverse --margin=1,2'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'highlight': 'Normal', 'border': 'rounded' } }

" NERDTree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>E :NERDTreeFocus<CR>

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified':'● ', 'Staged':' ', 'Untracked':' ', 'Renamed':' ',
    \ 'Unmerged':' ', 'Deleted':' ', 'Dirty':' ', 'Clean':' ', 'Unknown':' '}
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

" COC.NVIM
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 2]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <leader>ac <Plug>(coc-codeaction-cursor)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

xmap <leader>m  <Plug>(coc-format-selected)
nmap <leader>m  <Plug>(coc-format-selected)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let g:coc_global_extensions = ['coc-snippets']

" Git
nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gp :Gpush<CR>

nnoremap [h <Plug>(GitGutterPrevHunk)
nnoremap ]h <Plug>(GitGutterNextHunk)

highlight! link SignColumn LineNr

" Auto-Pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsMapSpace = 1

" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

nmap f <Plug>(easymotion-overwin-f)

nmap S <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_filetypes = ['nerdtree', 'netrw', 'fzf']
