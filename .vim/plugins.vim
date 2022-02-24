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
  " === vim-tpope === {{{
    Plug        'tpope/vim-abolish'
    Plug        'tpope/vim-obsession'
    Plug        'tpope/vim-unimpaired'
    Plug        'tpope/vim-commentary'
    Plug        'tpope/vim-repeat'
    Plug        'tpope/vim-eunuch'
  " }}}
  " === vim-gutentags === {{{
  Plug        'ludovicchabant/vim-gutentags'
  " }}}
  " === vim-auto-popmenu === {{{
  Plug        'skywind3000/vim-auto-popmenu'
  let g:apc_enable_ft={"*":1}
	let g:apc_enable_tab=0
  let g:apc_cr_confirm=1
  " }}}
  " === vim-sandwich === {{{
  Plug        'machakann/vim-sandwich'
  " }}}
  " === vim-asyncrun === {{{
  Plug	      'skywind3000/asyncrun.vim'
  " }}}
  " === ctrlp === {{{
  Plug        'ctrlpvim/ctrlp.vim'
  " Use fd or rg for ctrlp.
  let g:ctrlp_use_caching=0
  if executable('fd')
    let g:ctrlp_user_command='fd --type f --color=never "" %s'
  elseif executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command='rg %s --files --color=never --glob ""'
  else
    let g:ctrlp_use_caching=1
    let g:ctrlp_clear_cache_on_exit=0
  endif
  " }}}
  " === quick-scope === {{{
  Plug 'unblevable/quick-scope' 
  let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
  let g:qs_max_chars=120
  " }}}
  " === xptemplate === {{{
  Plug	      'drmingdrmer/xptemplate'
  let g:xptemplate_minimal_prefix=0
  " }}}
  " === tagbar === {{{
  Plug	      'preservim/tagbar'
  " }}}
  " === tabular === {{{
  Plug        'godlygeek/tabular'
  " }}}
  " === black === {{{
  if executable('black')
    Plug        'psf/black', {'for': 'python'}
    let g:black_virtualenv=$HOME . "/.local/pipx/venvs/black"
  endif
  " }}}
  " === khuno === {{{
  if executable('flake8')
    Plug        'alfredodeza/khuno.vim'
    let g:khuno_flake_cmd=$HOME . "/.local/pipx/venvs/flake8/bin/flake8"
    let g:khuno_builtins="_,apply"
    let g:khuno_max_line_length=99
  endif
  " }}}
  " === jupytext === {{{
  if executable('jupytext')
    Plug        'goerz/jupytext.vim'
    let g:jupytext_fmt='py'
  endif
  " }}}
  " === everforest === {{{
  Plug        'sainnhe/everforest'
  let g:everforest_transparent_background=1
  let g:everforest_disable_italic_comment=0
  let g:everforest_spell_foreground='colored'
  let g:everforest_ui_contrast='high'
  let g:everforest_background='soft'
  let g:everforest_enable_italic=1
  " }}}
  " === markdown === {{{
  Plug	      'bo1929/vim-markdown'
  Plug	      'mzlogin/vim-markdown-toc'
  " }}}
  " === vimtex === {{{ 
  if executable('latexmk')
    Plug        'lervag/vimtex'
    let g:tex_fast=""
    let g:vimtex_fold_manual=1
    let g:vimtex_matchparen_enabled=0
    let g:vimtex_include_search_enabled=0
    let g:vimtex_quickfix_autoclose_after_keystrokes=3
    if executable('zathura')
      let g:vimtex_view_method='zathura'
    endif
  endif
  " }}}
  " === goyo === {{{
  Plug        'junegunn/goyo.vim'
  " }}}
  " === lightline === {{{
  Plug        'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'everforest',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ],
    \            [ 'format-options', 'obsession-status', 'percent' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'tabs' ] ],
    \   'right': []
    \ },
    \ 'tab': {
    \   'active': [ 'tabnum', 'readonly', 'filename', 'modified' ],
    \   'inactive': [ 'tabnum', 'readonly', 'filename', 'modified' ]
    \ },
    \ 'component': {
    \   'format-options': '[%{&fo}]',
    \ },
    \ 'component_function': {
    \   'obsession-status': 'ObsessionStatus',
    \ },
    \ }
  " }}}
call plug#end()
