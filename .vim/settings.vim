filetype plugin indent on
set nocompatible
set encoding=utf-8

" === General Settings === {{{
set belloff=all                             " No beep beep.
set hidden                                  " Buffer becomes hidden when it is abandoned.
set showtabline=2                           " Always show tab page labels.
set laststatus=2                            " Last window will always have a status line.
set ruler                                   " Always show cursor position
set wildmenu                                " Display command line’s tab complete options as a menu.
set backspace=indent,eol,start              " Make backspace behave like usual.
set timeout timeoutlen=250 ttimeoutlen=20   " Timeout for key sequences, mappings.
set number                                  " Show current line number.
set relativenumber                          " Show relative line numbers.
set nojoinspaces                            " Separate sentences by a period and one space when using gq.
set noesckeys                               " Immediately perceive Escape in insert mode.
"" set showcmd                                 " Display incomplete commands.
" }}}

" === Folding === {{{
set foldmethod=marker           " Use markers to define folds.
" }}}

" === Cursor === {{{
let &t_SI="\e[6 q"              " Change cursor while chaning mode.
let &t_EI="\e[2 q"              " Change cursor while chaning mode.
set guicursor+=a:blinkon0       " Stop cursor blanking.
" }}}

" === Directories === {{{
let swap_directory = $HOME . './tmp/vim/swap/'
if filereadable(swap_directory)
    set dir=swap_directory
endif
" Set up backup location and enable.
set backup
let backup_directory = $HOME . './tmp/vim/backup/'
if filereadable(backup_directory)
    set backupdir=backup_directory
endif
set undofile
    set undoreload=50000
let undo_directory = $HOME . './tmp/vim/undo/'
if filereadable(undo_directory)
    set undodir=undo_directory
endif
" }}}

" === Indentation === {{{
set autoindent              " New lines inherit indentation.
set expandtab               " Convert tabs to spaces.
set tabstop=4               " Show existing tab with 4 spaces width.
set shiftwidth=4            " When indenting with '>', use 4 spaces width.
set shiftround              " Round the indent to a multiple of shiftwidth.
" }}}

" === Screen Splitting === {{{
set splitbelow                  " Put new window to the below of current one.
set splitright                  " Put new window to the right of current one.
" }}}

" === Search Settings === {{{
set hlsearch            " Highlight all its matches.
set incsearch           " Do incremental searching.
set wildignorecase      " Case-insensitive search.
" }}}

" === Autocomplete === {{{
set completeopt=menuone,noinsert,noselect,preview
set shortmess+=c " Don't give ins-completion-menu messages.
" }}}

" === Visual Related === {{{
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    let &t_ut=''
    set termguicolors
endif

if !has('gui_running')
    set t_Co=256
endif

colorscheme everforest
set background=dark
syntax on               " Enable syntax highlighting.
"" set lazyredraw          " Don't redraw screen for macros auto-commands etc.
set fillchars+=vert:\  " Set the vertical split character to a space.
"" set re=1

"" hi Normal ctermbg=NONE guibg=NONE
"" hi Folded ctermbg=NONE guibg=NONE
" }}}
