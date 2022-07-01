" == Settings == {{{
setlocal spell
setlocal spelllang=en_us,tr

setlocal suffixesadd=.tex

setlocal conceallevel=2

setlocal complete+=k

set formatexpr=OneSentencePerLine()

setlocal autoread
set autoread

function! LatexIndent()
  if executable('latexindent')
    " if exists(":AsyncRun")
    "   silent! execute ':AsyncRun! latexindent -l % -o %'
    " else
      silent! execute ':! latexindent -l % -o %'
    " endif
    silent! execute ':redraw!'
  endif
endfunction

augroup LatexIndentation
  autocmd! BufWritePost *.tex execute ':call LatexIndent()'
augroup END

" Local settings to wrap lines.
silent call LocalWrap(0, repeat(">", &shiftwidth))
" }}}
