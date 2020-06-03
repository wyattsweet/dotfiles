set nocompatible

call plug#begin('~/.vim/plugged')
" Plug 'ngmy/vim-rubocop'
Plug 'VundleVim/Vundle.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'gabrielelana/vim-markdown'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'matze/vim-move'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

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
colorscheme onedark

" always use vertical cursor
" set guicursor+=a:ver100-iCursor
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor

" automatically set hidden bufers
set hidden

" map buffer previous & buffer next
map bp :bp<cr>
map bn :bn<cr>

set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
" break lines on word
set linebreak

" comfortable-motion
nnoremap <silent> <C-n> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-m> :call comfortable_motion#flick(-100)<CR>
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

" vim-prettier, run async (before saving)
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" Don't print semicolons
let g:prettier#config#semi = 'true'
" no trailing commas
let g:prettier#config#trailing_comma = 'all'
" space between brackets
let g:prettier#config#bracket_spacing = 'true'

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

" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetsDir="~/.vim/mysnippets"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" disable folding in markdown files
let g:vim_markdown_folding_disabled = 1

set guicursor+=a:ver100-iCurso

" disable mouse
set mouse-=a

" yank directly to clipboard
set cb=unnamed

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
nnoremap <leader>n :tabn<CR>
" map leader p move to previous tab
nnoremap <leader>p :tabp<CR>
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
" map leader w to :w
nnoremap <leader>w :w<CR>
" git add file to staging
nnoremap <leader>gw :Gw<CR> 
nnoremap <leader>gd :Gdiff<CR>


""" COC CONFIG

let g:coc_disable_startup_warning = 1

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
