" Python editor settings.
setlocal tabstop=4 shiftwidth=4 softtabstop=4
set omnifunc=python3complete#Complete

if executable('black')
  augroup FormatPython
    autocmd BufWritePre *.py silent! execute ':Black'
    autocmd FileType python nnoremap <silent> <buffer> <F9> :Black<CR>
  augroup END
endif

if executable('flake8')
  augroup LintPython
    autocmd FileType python nmap <silent> <buffer> <F7> <Esc>:Khuno show<CR>
  augroup END
endif
