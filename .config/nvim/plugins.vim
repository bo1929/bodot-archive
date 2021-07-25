" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin(stdpath('config') . '/vim-plugins/')
    " Colorschemes:
        Plug        'morhetz/gruvbox'
        "" Plug        'fenetikm/falcon'
        "" Plug        'ayu-theme/ayu-vim'
        "" Plug        'adrian5/oceanic-next-vim'
        "" Plug        'NLKNguyen/papercolor-theme'
    " Airline:
        Plug        'vim-airline/vim-airline'
        "" Plug        'vim-airline/vim-airline-themes'
    " Language-related:
        Plug        'sheerun/vim-polyglot'
        Plug        'nvie/vim-flake8'
        Plug        'lervag/vimtex'

    "" Plug        'ctrlpvim/ctrlp.vim'
    "" Plug        'sheerun/vim-polyglot'
    "" Plug        'tpope/vim-unimpaired'
    "" Plug        'tpope/vim-sensible'
    "" Plug        'tpope/vim-eunuch'
    "" Plug        'tpope/vim-repeat'
    "" Plug        'tpope/vim-commentary
    "" Plug        'honza/vim-snippets'
    "" Plug        'SirVer/ultisnips'
    "" Plug        'junegunn/goyo.vim'
    Plug        'vimwiki/vimwiki'
    Plug        'tpope/vim-vinegar'
    Plug        'tpope/vim-obsession'
    Plug        'machakann/vim-sandwich'
call plug#end()

" Flake8:
let g:flake8_cmd="/home/bo/.local/bin/flake8"
let g:flake8_show_in_file=1 " show

" VimWiki:
let g:vimwiki_list = [{'path': '~/Files/misc/notes/vimwiki-notes','path_html': '~/Files/misc/notes/vimwiki-notes/html-output/'}]

" Airline:
"" let g:airline_theme='solarized'
"" let g:airline_theme='base16_irblack'
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#buffer_idx_mode =1

let g:airline#extensions#obsession#enabled=1
let g:airline#extensions#obsession#indicator_text='$'

"" let g:airline#extensions#vimtex#enabled = 1
"" let g:airline#extensions#vimtex#continuous = "c"

" Gruvbox:
let g:gruvbox_italic=1

" Ayu:
"" let ayucolor="light"  " for light version of theme
"" let ayucolor="mirage" " for mirage version of theme
"" let ayucolor="dark"   " for dark version of theme

" VimTex:
" This option does not exist. Check vimtex docs for more info.
"" let g:vimtex_latexmk_continuous=1
let g:vimtex_quickfix_autoclose_after_keystrokes=3
let g:vimtex_view_method = 'zathura'
