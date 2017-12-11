set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugin from Github user/repo
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim'
Plugin 'ervandew/supertab'
Plugin 'alvan/vim-closetag'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-obsession'
Plugin 'dracula/vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'sbdchd/neoformat'
Plugin 'matze/vim-move'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable 
syntax on
color dracula
filetype plugin indent on

" automatically set hidden bufers
set hidden

" map buffer previous & buffer next
map bp :bp<cr>
map bn :bn<cr>

set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start

set guifont=Monaco:h13

" enables jsx in .jsx and .js file extensions
let g:jsx_ext_required = 0

" turn off parenthesis matching
" :let loaded_matchparen = 1

"turn on line number
set number

set runtimepath^=~/.vim/bundle/ctrlp.vim

au BufRead,BufNewFile *.ejs setfiletype html

"NERDTree settings

"NERDTree width
let g:NERDTreeWinSize=30

"Auto open NERDTree
"au VimEnter * NERDTree

"Show hidden files
let NERDTreeShowHidden=1

" Enter opens a new file in a tab from nerdtree
" let NERDTreeMapOpenInTab='<ENTER>'

" Allow Airline to open in new tabs
set laststatus=2

" Vim-close tag setting
let g:closetag_filenames = "*.erb,*.html,*.xhtml,*.phtml,*.jsx,*.js"

let g:ctrlp_max_files=0

let g:ctrlp_max_height=20

" ctrlP opens file in a new tab
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<c-t>'],
"     \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"     \ }

" Invoke CtrlP by pressing ctrl + p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" The Port Livedown runs on
let g:livedown_port = 1337

let g:airline#extensions#tabline#enabled = 1 

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Run Neoformat automatically on save
autocmd BufWritePre *.jsx Neoformat

" Nerformat config
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ none

" Use formatprg when available
let g:neoformat_try_formatprg = 1

" auto update file when it changes
set autoread

" change vim-move modifier key
let g:move_key_modifier = 'C'

let g:ack_mappings = {
      \  'v': '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

" removes scroll bar in macvim
set guioptions=aem
