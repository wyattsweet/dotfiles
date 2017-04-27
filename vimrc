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
Plugin 'shime/vim-livedown'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
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
set background=dark
colorscheme material-theme 

filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start

set guifont=Monaco:h12

let g:jsx_ext_required = 0

" turn off parenthesis matching
:let loaded_matchparen = 1

"turn on line number
set number

set runtimepath^=~/.vim/bundle/ctrlp.vim

au BufRead,BufNewFile *.ejs setfiletype html

"NERDTree settings

"NERDTree width
let g:NERDTreeWinSize=30
"Auto open
au VimEnter * NERDTree
"Show hidden files
let NERDTreeShowHidden=1


" Vim-close tag setting
let g:closetag_filenames = "*.erb,*.html,*.xhtml,*.phtml,*.jsx,*.js"

