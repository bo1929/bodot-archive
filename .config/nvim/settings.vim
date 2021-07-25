filetype plugin indent on

set nocompatible
set encoding=utf-8

" No beep beep:
set belloff=all

" Sentences should be separated by a period and ONE space when using gq:
"" set nojoinspaces
" Make backspace behave like usual:
set backspace=indent,eol,start
" When on, a buffer becomes hidden when it is abandoned:
set hidden
" Always show tab page labels:
set showtabline=2
" Last window will always have a status line:
set laststatus=2
" Always show cursor position:
set ruler
" Display command line’s tab complete options as a menu:
set wildmenu
" Display incomplete commands:
set showcmd
" Immediately perceive Escape in insert mode:
"" set noesckeys

" Folding:
" Use markers to define folds:
set foldmethod=marker

" Stop cursor blanking:
set guicursor+=a:blinkon0

let g:backupdir=has('nvim') ? stdpath('data') . '/backup' : '~/.vim' . '/backup'
if !isdirectory(g:backupdir)
    call mkdir(g:backupdir, "p")
endif
let &backupdir=g:backupdir
set backup
set undofile
set undoreload=50000

"
" Line Indentation:
" New lines inherit the indentation of previous lines:
set autoindent
" Convert tabs to spaces:  
set expandtab
" Show existing tab with 4 spaces width:
set tabstop=4
" When indenting with '>', use 4 spaces width:
set shiftwidth=4
" Round the indent to a multiple of shiftwidth:
set shiftround


" Timeout Settings:
set timeoutlen=250
set ttimeoutlen=10


" Screen Splitting:
" When on, splitting a window will put the new window below the current one:
set splitbelow
" When on, splitting a window will put the new window below the current one:
set splitright


" Search Settings:
" Highlight all its matches:
set hlsearch
" Do incremental searching:
set incsearch
" Case-insensitive search:
set wildignorecase


" Line Numbers:
" Show current line number:
set number
" Show relative line numbers:
set relativenumber


" Autocomplete:
" Complete longest common string, then list alternatives:
set wildmode=full
" Use the popup menu also when there is only one match:
set completeopt+=menuone
" Do not select a match in the menu:
set completeopt+=noselect
" Don't give |ins-completion-menu| messages:
set shortmess+=c


" Visual Related:
set background=dark
colorscheme gruvbox

" Screen won't be redrawn (while executing macros, registers, auto-commands):
"" set lazyredraw
" Display $ after end of the line:
set list
" Set the vertical split character to  a space:
set fillchars+=vert:\ 
" Enable syntax highlighting:
syntax on

if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    let &t_ut=''
    set termguicolors
endif

set pumblend=15
hi Normal ctermbg=NONE guibg=NONE
hi PmenuSel blend=0
hi clear CursorLineNR
