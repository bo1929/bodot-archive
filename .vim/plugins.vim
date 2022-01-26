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
  Plug        'ludovicchabant/vim-gutentags'
  Plug        'machakann/vim-sandwich'
  Plug        'tpope/vim-obsession'
  Plug        'tpope/vim-unimpaired'
  Plug        'tpope/vim-commentary'
  Plug        'tpope/vim-sleuth'
  Plug        'tpope/vim-vinegar'
  Plug        'tpope/vim-eunuch'
  " Plug        'tpope/vim-fugitive'
  " Plug        'tpope/vim-abolish'
  " === quick-scope === {{{
  Plug 'unblevable/quick-scope' 
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  let g:qs_max_chars=120
  " }}}
  " === vim-auto-popmenu === {{{
  Plug        'bo1929/vim-auto-popmenu'
  let g:apc_enable_ft = {"*":1}
  " }}}
  " === ctrlp === {{{
  Plug        'ctrlpvim/ctrlp.vim'
  " Use fd or rg for ctrlp.
  if executable('fd')
    let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
    let g:ctrlp_use_caching = 0
  elseif executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  else
    let g:ctrlp_clear_cache_on_exit = 0
  endif
  " }}}
  " === lightline === {{{
  Plug        'itchyny/lightline.vim'
  let g:lightline = {
	\  'colorscheme': 'nord',
	\ }
  " }}}
  " === nord === {{{
  Plug 'arcticicestudio/nord-vim'
  " }}}
  " === everforest === {{{
  " Plug        'sainnhe/everforest'
  " let g:everforest_transparent_background = 1
  " let g:everforest_background = 'soft'
  " let g:everforest_enable_italic = 1
  " }}}
  " === vimtex === {{{ 
  if executable('latexmk')
    Plug        'lervag/vimtex'
    let g:tex_fast = ""
    let g:vimtex_fold_manual = 1
    if executable('zathura')
      let g:vimtex_view_method = 'zathura'
    endif
    let g:vimtex_quickfix_autoclose_after_keystrokes=3
  endif
  " }}}
  " === vimwiki === {{{
  Plug        'vimwiki/vimwiki'
  let wiki_markdown = {'path': $HOME . '/notes/markdown/',
	\ 'syntax': 'markdown', 'ext': '.md',
	\'path_html': $HOME . '/notes/markdown/html-output/'}
  let wiki_vimwiki = {'path': '~/notes/vimwiki',
	\'path_html': $HOME . '/notes/vimwiki/html-output/'}
  let g:vimwiki_list = [wiki_vimwiki, wiki_markdown]
  let g:vimwiki_folding = 'expr'
  " }}}
  " === jupytext === {{{
  if executable('jupytext')
    Plug        'goerz/jupytext.vim'
    let g:jupytext_fmt = 'py'
  endif
  " }}}
  " === khuno === {{{
  if executable('flake8')
    Plug        'alfredodeza/khuno.vim'
    let g:khuno_flake_cmd = $HOME . '/.local/bin/flake8'
    let g:khuno_builtins="_,apply"
    let g:khuno_max_line_length=99
  endif
  " }}}
  " === black === {{{
  if executable('black')
    Plug        'psf/black', {'for': 'python'}
    let g:black_virtualenv = $HOME . "/.local/pipx/venvs/black"
  endif
  " }}}
  " == xptemplate == {{{
  Plug	      'drmingdrmer/xptemplate'
  let g:xptemplate_minimal_prefix = 0
  " }}}
call plug#end()
