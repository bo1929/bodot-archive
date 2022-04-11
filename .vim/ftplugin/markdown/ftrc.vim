" == Settings == {{{
setlocal spell
setlocal spelllang=en_us,tr

setlocal suffixesadd=.md

setlocal conceallevel=2

setlocal foldtext=DotFoldText()

setlocal complete+=k

set formatexpr=OneSentencePerLine()

" Local settings to wrap lines.
silent call LocalWrap(0, repeat(">", &shiftwidth))
" }}}

" == Mappings == {{{
" Align tables.
  augroup LintPython
    autocmd FileType markdown inoremap <silent> <buffer> <Bar> <Bar><Esc>:call AlignTable()<CR>a
  augroup END

" }}
