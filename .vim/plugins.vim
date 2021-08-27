" Install vim-plug if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif 

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/vim-plug')
    Plug        'sainnhe/everforest'
    Plug        'itchyny/lightline.vim'
    Plug        'tpope/vim-vinegar'
    Plug        'tpope/vim-obsession'
    Plug        'tpope/vim-unimpaired'
    Plug        'machakann/vim-sandwich'
    Plug        'ludovicchabant/vim-gutentags'
    Plug        'skywind3000/vim-auto-popmenu'
    " Wiki:
    Plug        'vimwiki/vimwiki'
    " Python:
    Plug        'nvie/vim-flake8'
    "" Plug        'psf/black', {'for': 'python', 'branch': 'stable' }
    " Tex:
    Plug        'lervag/vimtex'
    " Markdown:
    "" Plugin       'godlygeek/tabular'
    "" Plugin       'plasticboy/vim-markdown'
call plug#end()

" === flake8 === {{{
let g:flake8_cmd="/home/bo/.local/bin/flake8"
let g:flake8_show_in_file=1 " show
" }}}
" === vimwiki === {{{
let g:vimwiki_list = [{'path': '~/notes/vimwiki',
            \'path_html': '~/notes/vimwiki/html-output/'}]
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
" === UltiSnips === {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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
let g:everforest_transparent_background = 1
let g:everforest_enable_italic = 1
" }}}
" === vim-auto-popmenu === {{{
let g:apc_enable_ft = {'*':1}
let g:apc_enable_tab = get(g:, 'apc_enable_tab', 0)
" }}}
