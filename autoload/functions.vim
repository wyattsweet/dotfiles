" custom vim functions
" filename#FunctionName()

function! functions#Markdown()
    source ~/.vim/after/ftplugin/markdown.vim
    NERDTree
    call feedkeys("O")
endfunction
