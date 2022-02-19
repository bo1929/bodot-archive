" Python editor settings.
setlocal tabstop=4 shiftwidth=4 softtabstop=4
setlocal omnifunc=python3complete#Complete

if exists(':Black') && executable('black')
  augroup FormatPython
    autocmd BufWritePre *.py silent! execute ':Black'
    autocmd FileType python nnoremap <silent> <buffer> <F8> :Black<CR>
  augroup END
endif

if exists(':Khuno') && executable('flake8')
  augroup LintPython
    autocmd FileType python nmap <silent> <buffer> <F7> <Esc>:Khuno show<CR>
  augroup END
endif
