" == Settings == {{{
setlocal spell
setlocal spelllang=en_us,tr

setlocal suffixesadd=.tex

setlocal conceallevel=2

setlocal complete+=k

set formatexpr=OneSentencePerLine()

setlocal autoread
set redraw

function! LatexIndent()
  if executable('latexindent')
    if !exists(":AsyncRun")
      silent! execute ':! latexindent -l % -o %'
      silent! execute ':redraw!'
    else
      silent! execute ':AsyncRun latexindent -l % -o %'
  endif
endfunction

augroup LatexIndentation
  autocmd! BufWritePost *.tex execute ':call LatexIndent()'
augroup END

" Local settings to wrap lines.
silent call LocalWrap(0, repeat(">", &shiftwidth))
" }}}
