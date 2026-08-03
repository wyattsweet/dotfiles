set nocompatible
let g:polyglot_disabled = ['markdown']

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'matze/vim-move'
Plug 'pangloss/vim-javascript'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'Mizux/vim-colorschemes'
Plug 'therubymug/vim-pyte'
Plug 'itspriddle/vim-marked'
Plug 'dhruvasagar/vim-table-mode'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
call plug#end()

lua << EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-m>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- End of nvim-cmp setup
  require("lspconfig").pyright.setup{}
  require("lspconfig").eslint.setup{}

  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
EOF

" set the leader key to space
let mapleader = "\<Space>"

" True color support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if !has('gui_running')
  set t_Co=256
endif

" syntax enable 
syntax on
filetype plugin indent on

let g:python_highlight_all = 1
" change color theme
colorscheme pyte

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" automatically set hidden bufers
set hidden

" map buffer previous & buffer next
map bp :bp<cr>
map bn :bn<cr>

set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
" break lines on word
set wrap
set linebreak

" comfortable-motion
nnoremap <silent> <C-n> :call comfortable_motion#flick(100)<CR>
noremap <silent> <C-m> :call comfortable_motion#flick(-100)<CR>

" enables jsx in .jsx and .js file extensions
let g:jsx_ext_required = 0

"turn on line number
set number

au BufRead,BufNewFile *.ejs setfiletype html

"NERDTree settings

"NERDTree width
let g:NERDTreeWinSize=30

"Show hidden files
let NERDTreeShowHidden=1

nmap <leader>t :NERDTreeToggle<CR>

" Allow Airline to open in new tabs
set laststatus=2

" Vim-close tag setting
let g:closetag_filenames = "*.erb,*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx,*.ts"

" lightline colorscheme config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Use formatprg when available
let g:neoformat_try_formatprg = 1

" change vim-move modifier key
let g:move_key_modifier = 'C'

let g:ack_mappings = {
      \  'v': '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

" automatically turns on spellcheck for Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Setting up UtliSnips for NeoVim - https://jdhao.github.io/2019/04/17/neovim_snippet_s1/
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" disable folding in markdown files
let g:vim_markdown_folding_disabled = 1
let g:table_mode_corner='|'

" disable mouse
set mouse-=a

" yank directly to clipboard
" set cb=unnamed

" Always highlight searched text
set hlsearch

" no swp files
set noswapfile

" ag – only search the contents of files and not file names
" https://github.com/junegunn/fzf.vim/issues/346
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind leader a to start ag search of word under cursor in current file
nnoremap <leader>a :Ag <c-r><c-w><CR>

" fzf search hotkeys
nnoremap <leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>
" search for current word under cursor with :Tags fzf command
nnoremap <leader>k :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <leader>s :Ag<CR>
nnoremap <Leader>sw :call fzf#vim#tags(expand('<cword>'))

nnoremap <leader>[ <c-w>10<
nnoremap <leader>] <c-w>10>
" map leader n move to next tab
nnoremap <leader>tn :tabn<CR>
" map leader p move to previous tab
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
" map leader w to :w
nnoremap <leader>w :w<CR>
" git add file to staging
nnoremap <leader>gw :Gw<CR> 
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>vimrc :vsplit $MYVIMRC<CR>
nnoremap <leader>snip :vsplit ~/dotfiles/mysnippets<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>
nnoremap <leader>r R
" Move buffer to the far left
nnoremap <Leader>ml :wincmd H<CR>
" move table to the left
nnoremap <Leader>tl :tabmove -1<CR>
" Move tab to the right
nnoremap <Leader>tr :tabmove +1<CR>
nnoremap <Leader>f :Prettier<CR>
nnoremap <Leader>ta :TableModeRealign<CR>

" Copy to system clipboard
vnoremap <Leader>y "*y
noremap <Leader>p "*p

""" CUSTOM FUNCTIONS
command Markdown call functions#Markdown()

" source local config if it exists
call functions#SourceIfExists('~/.config/nvim/local.vim')
