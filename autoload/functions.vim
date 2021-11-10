" custom vim functions
" filename#FunctionName()

function! functions#Markdown()
    source ~/.config/nvim/ftplugin/markdown.vim
    NERDTree
    call feedkeys("O")
endfunction

" Function to source only if file exists {
function! functions#SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
