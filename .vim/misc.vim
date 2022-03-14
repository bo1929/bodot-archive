" Toggle netrw explorer window.
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    let cur_win_num = winnr()
    if expl_win_num != -1
      while expl_win_num != cur_win_num
        exec "wincmd w"
        let cur_win_num = winnr()
      endwhile
      try
        close
      catch /^Vim\%((\a\+)\)\=:E444/
        b#
      endtry
    endif
    unlet t:expl_buf_num
  else
    20Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction

" Swicth to netrw explorer window.
function! SwitchNetrwWindow()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      exec expl_win_num . "wincmd w"
    endif
  endif
endfunction

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

" Alignment for tables using Tabularize.
function! AlignTable()
  if exists(":Tabularize") && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let p = '^\s*|\s.*\s|\s*$'
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
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

function! DotFoldText()
  let nblines = v:foldend - v:foldstart + 1
  let w = winwidth(0) - &foldcolumn - (&number ? 3 : 0)
  let expansionString = repeat(".", w - strwidth(nblines.'"') - 1)
  let txt = nblines . " " . expansionString
  return txt
endfunction

function! LocalWrap(tw=0, sbr='>', brk=' ^I!@*-+;:,./?')
  setlocal wrap
  setlocal nolist
  setlocal linebreak
  setlocal breakindent
  " Set tw=0 to soft wrap.
  let &l:textwidth=a:tw
  let &l:showbreak=a:sbr
  let &l:breakat=a:brk
endfunction

function! LocalNoWrap()
  setlocal nowrap
  setlocal nolinebreak
  setlocal nojoinspaces
  setlocal sidescroll=1
  setlocal textwidth=0 
  setlocal wrapmargin=0
  setlocal listchars+=precedes:<,extends:>
endfunction

" Append timestamps.
if !exists(":AppendDate")
  command! AppendDate :normal a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
endif

" New commands for async 'grep' and 'make'.
if exists(":AsyncRun")
  if !exists(":AsyncMake") 
    command! -bang -nargs=* -complete=file -bar AsyncMake  AsyncRun<bang> -program=make -auto=make @ <args>
  endif
  if !exists(":AsyncGrep") 
    command! -bang -nargs=* -complete=file -bar AsyncGrep  AsyncRun<bang> -program=grep -auto=grep @ <args>
  endif
endif

if exists("##GoyoEnter") && exists("##GoyoLeave") && exists(":Limelight")
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
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

augroup SetFormatOptions
  " Format options.
  " autocmd Filetype * setlocal fo=tcq1lnp
  autocmd Filetype * setlocal fo-=r fo-=o
augroup END
