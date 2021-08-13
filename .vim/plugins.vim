" Install vim-plug if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins.
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/vim-plug')
    Plug        'tpope/vim-vinegar'
    Plug        'tpope/vim-obsession'
    Plug        'tpope/vim-unimpaired'
    Plug        'machakann/vim-sandwich'
    Plug        'vimwiki/vimwiki'
    Plug        'sainnhe/everforest'
    Plug        'itchyny/lightline.vim'
    Plug        'ludovicchabant/vim-gutentags'
    " Python:
    Plug        'nvie/vim-flake8'
    Plug        'vim-python/python-syntax'
    " Tex:
    "" Plug        'lervag/vimtex', { 'for': ['tex'] }
call plug#end()

" === flake8 === {{{
let g:flake8_cmd="/home/bo/.local/bin/flake8"
let g:flake8_show_in_file=1 " show
" }}}
" === vimwiki === {{{
let g:vimwiki_list = [{'path': '~/Files/misc/notes/vimwiki-notes',
            \'path_html': '~/Files/misc/notes/vimwiki-notes/html-output/'}]
" }}}
" === lightline === {{{
let g:lightline = {
          \ 'colorscheme': 'everforest',
      \ }
" }}}
" === vim-airline === {{{
let g:airline_powerline_fonts=1
let g:airline_statusline_ontop=1

let g:airline_extensions = []

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#buffer_idx_mode =1

let g:airline#extensions#obsession#enabled=1
let g:airline#extensions#obsession#indicator_text='$'

let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#vimtex#continuous = "c"
" }}}
" === python-syntax === {{{
let g:python_highlight_all = 1
" }}}
" === vimtex === {{{ 
let g:vimtex_quickfix_autoclose_after_keystrokes=3
let g:vimtex_view_method = 'zathura'
" }}}
" === gruvbox === {{{
"" let g:gruvbox_italic=1
" }}}
" === material-color === {{{
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
" }}}
" === everforest === {{{
let g:everforest_enable_italic = 1
let g:everforest_current_word = 'bold'
let g:everforest_better_performance = 1
" }}}
