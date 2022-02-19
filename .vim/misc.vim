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
  " hi clear SignColumn
  " hi clear LineNr
endfunction

function! ToggleBG()
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:colors_name")
    exe "colorscheme " . g:colors_name
  endif
  call HiClear()
  call HiNoneBG()
endfunction

function! MyFoldText()
    let nblines = v:foldend - v:foldstart + 1
    let w = winwidth(0) - &foldcolumn - (&number ? 3 : 0)
    let expansionString = repeat(".", w - strwidth(nblines.'"') - 1)
    let txt = nblines . " " . expansionString
    return txt
endfunction

function LocalWrap(...)
  setlocal wrap
  setlocal nolist
  " Set tw=0 to soft wrap.
  let &l:textwidth=get(a:, 1, 0)
  setlocal linebreak
  setlocal breakindent
  setlocal showbreak=+++
  let &l:breakat=get(a:, 2,' ^I!@*-+;:,./?')
endfunction

function NoWrap()
  set nowrap
  set nojoinspaces
  set textwidth=0 
  set wrapmargin=0
  set sidescroll=1
  set listchars+=precedes:<,extends:>
endfunction

" Append timestamps.
if !exists(":AppendDate")
  command! AppendDate :normal a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
endif

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
  " Format options.
  autocmd FileType * setlocal fo+=q fo+=n fo+=j fo+=p fo+=1
  autocmd FileType * setlocal fo-=c fo-=o fo-=r
augroup END
