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

" Append timestamps.
command! AppendDate :normal a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" {{{ === AutoCommands ===
" Reset cursor on startup
augroup ResetCursorShape
  au!
  autocmd VimEnter * :normal :startinsert :stopinsert 
augroup END

augroup FileTypeCommands
  autocmd!
  " Disale auto-comment insertion:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType html,sh,tex setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType md,vimwiki setlocal nowrap
augroup END

augroup LintPython
  autocmd BufWritePost *.py call flake8#Flake8()
augroup END
augroup FormatPython
  autocmd BufWritePre *.py execute ':Black'
  autocmd FileType python nnoremap <buffer> <F9> :Black<CR>
augroup END
" }}}
