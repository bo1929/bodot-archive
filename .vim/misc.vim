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
" Disale auto-comment insertion:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Reset cursor on startup
augroup ResetCursorShape
    au!
    autocmd VimEnter * :normal :startinsert :stopinsert 
augroup END
