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
    Plug        'psf/black', {'for': 'python'}
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
let wiki_markdown = {'path': '~/notes/markdown/',
                \ 'syntax': 'markdown', 'ext': '.md',
                \'path_html': '~/notes/markdown/html-output/'}
let wiki_vimwiki = {'path': '~/notes/vimwiki',
            \'path_html': '~/notes/vimwiki/html-output/'}
let g:vimwiki_list = [wiki_vimwiki, wiki_markdown]
" }}}
" === lightline === {{{
let g:lightline = {
          \ 'colorscheme': 'everforest',
      \ }
" }}}
" === vimtex === {{{ 
let g:vimtex_quickfix_autoclose_after_keystrokes=3
let g:vimtex_view_method = 'zathura'
" }}}
" === everforest === {{{
let g:everforest_transparent_background = 1
let g:everforest_enable_italic = 1
" }}}
" === vim-auto-popmenu === {{{
let g:apc_enable_ft = {'*':1}
let g:apc_enable_tab = get(g:, 'apc_enable_tab', 0)
" }}}
" === black === {{{
let g:black_virtualenv = "~/.local/pipx/venvs/black"
" }}}
