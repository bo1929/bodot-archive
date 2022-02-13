" Twiddle the case of text under the cursor.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result=tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result=substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result=toupper(a:str)
  endif
  return result
endfunction

function! HiNoneBG()
  hi Normal guibg=NONE ctermbg=NONE
  hi Folded guibg=NONE ctermbg=NONE
  " hi CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
  " hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
  " hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
  " hi LineNr ctermbg=NONE
  " hi NonText ctermbg=NONE
  " hi SpecialKey ctermbg=NONE
  " hi VertSplit ctermbg=NONE
  " hi SignColumn ctermbg=NONE
endfunction

function! HiClear()
  hi clear CursorLine
  hi clear SignColumn
  " hi clear LineNr
endfunction

function! ToggleBG()
  let &background=( &background == "dark"? "light" : "dark" )
  if exists("g:colors_name")
    exe "colorscheme " . g:colors_name
  endif
  call HiNoneBG()
  call HiClear()
endfunction

" Append timestamps.
if !exists(":AppendDate")
  command! AppendDate :normal a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
endif

" {{{ === AutoCommands ===
augroup ResetCursorShape
  " Reset cursor on startup
  autocmd VimEnter * :normal :startinsert :stopinsert 
augroup END

augroup AdaptColorScheme
  " Adapt color scheme.
  autocmd ColorScheme * call HiNoneBG()
  autocmd ColorScheme * call HiClear()
augroup END

augroup DisableAutoComment
  " Disale auto-comment insertion:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
" }}}
