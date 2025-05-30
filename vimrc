set nocompatible

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
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
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
    require("CopilotChat").setup {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    } 

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
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
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline('/', {
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })

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

" Copilot settings
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" set the leader key to space
let mapleader = "\<Space>"

" Below is required for onedark theme

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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

" always use vertical cursor
" set guicursor+=a:ver100-iCursor
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor

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
set linebreak

" comfortable-motion
nnoremap <silent> <C-n> :call comfortable_motion#flick(100)<CR>
noremap <silent> <C-m> :call comfortable_motion#flick(-100)<CR>
" nnoremap <silent> <C-d> :call comfortable_motion#flick(200)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(-200)<CR>

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

nmap <leader>t :NERDTreeToggle<CR>

" Allow Airline to open in new tabs
set laststatus=2

" Vim-close tag setting
let g:closetag_filenames = "*.erb,*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx,*.ts"

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

" ignore node_modules in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
" let g:airline#extensions#tabline#fnamemod = ':t'

" lightline colorscheme config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Nerformat config
" autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ none

" vim-prettier
" Turn off auto formatting
" let g:prettier#autoformat = 0

" Use formatprg when available
let g:neoformat_try_formatprg = 1

" auto update file when it changes
" set autoread

" change vim-move modifier key
let g:move_key_modifier = 'C'

let g:ack_mappings = {
      \  'v': '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

" removes scroll bar in macvim
set guioptions=am
" set guioptions=aem
" set guifont=IBM\ Plex\ Mono:h14

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

" set guicursor+=a:ver100-iCurso

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

" Copy to system clipboard
vnoremap <Leader>y "*y
noremap <Leader>p "*p

""" CUSTOM FUNCTIONS
command Markdown call functions#Markdown()

" source local config if it exists
call functions#SourceIfExists('~/.config/nvim/local.vim')
