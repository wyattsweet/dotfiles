" custom vim functions
" filename#FunctionName()

function! functions#Markdown()
    source ~/.config/nvim/ftplugin/markdown.vim
    NERDTree
    call feedkeys("O")
endfunction
