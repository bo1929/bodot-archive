if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    "" Plug        'fenetikm/falcon'
    "" Plug        'ctrlpvim/ctrlp.vim'
    "" Plug        'honza/vim-snippets'
    "" Plug        'SirVer/ultisnips'
    "" Plug        'adrian5/oceanic-next-vim'
    Plug        'morhetz/gruvbox'
    "" Plug        'junegunn/goyo.vim'
    Plug        'vimwiki/vimwiki'
    Plug        'lervag/vimtex'
    Plug        'nvie/vim-flake8'
    Plug        'tpope/vim-vinegar'
    Plug        'tpope/vim-obsession'
    Plug        'sheerun/vim-polyglot'
    Plug        'machakann/vim-sandwich'
    Plug        'vim-airline/vim-airline'
    Plug       'ludovicchabant/vim-gutentags'
    Plug       'elifepillar/vim-mucomplete'
    "" Plug        'vim-airline/vim-airline-themes'
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
"" let g:gruvbox_italic=1

" Ayu:
"" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"" let ayucolor="dark"   " for dark version of theme

" VimTex:
" This option does not exist. Check vimtex docs for more info.
"" let g:vimtex_latexmk_continuous=1
let g:vimtex_quickfix_autoclose_after_keystrokes=3
let g:vimtex_view_method = 'zathura'
