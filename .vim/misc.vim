" Twiddle the case of text under the cursor.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

" AutoCommands:
" Reset cursor on startup
augroup ResetCursorShape
    au!
    autocmd VimEnter * :normal :startinsert :stopinsert 
augroup END

augroup FileTypeCommands
    autocmd!
	" Disale auto-comment insertion:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd FileType html,sh setlocal shiftwidth=2 tabstop=2
augroup END

" Plugin AutoCommands:
augroup LintPython
    autocmd BufWritePost *.py call flake8#Flake8()
augroup END
augroup FormatPython
    autocmd BufWritePre *.py execute ':Black'
    autocmd FileType python nnoremap <buffer> <F9> :Black<CR>
augroup END
