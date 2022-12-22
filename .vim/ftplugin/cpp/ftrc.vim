setlocal autoread
set autoread

setlocal complete+=k

setlocal suffixesadd=.cpp,.h

function! FormatClang()
  if executable('clang-format')
    let last_curpos = getcurpos()
    silent! execute ':%! clang-format'
    call setpos('.', last_curpos)
  endif
endfunction

augroup FormatCpp
  autocmd! BufWritePre *.cpp,*.h execute ':call FormatClang()'
augroup END
