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
  " Section: Core
  Plug        'machakann/vim-sandwich'
  Plug        'ludovicchabant/vim-gutentags'
  Plug        'tpope/vim-vinegar'
  Plug        'tpope/vim-obsession'
  Plug        'tpope/vim-unimpaired'
  "" Plug        'tpope/vim-fugitive'
  "" Plug        'tpope/vim-eunuch'
  "" Plug        'tpope/vim-commentary'
  "" Plug        'tpope/vim-abolish'
  " Section: Useful But Not Essential
" === vim-auto-popmenu === {{{
  Plug        'skywind3000/vim-auto-popmenu'
  let g:apc_enable_ft = {'tex':0, 'python':1}
  let g:apc_enable_tab = get(g:, 'apc_enable_tab', 0)
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
  "" Plug        'andymass/vim-matchup'
  " Section: Aesthetic:
" === lightline === {{{
  Plug        'itchyny/lightline.vim'
  let g:lightline = {
            \  'colorscheme': 'everforest',
        \ }
" }}}
" === everforest === {{{
  Plug        'sainnhe/everforest'
  let g:everforest_transparent_background = 1
  let g:everforest_background = 'hard'
  let g:everforest_enable_italic = 1
" }}}
  " Section: Writing and Note-taking
  " === vimtex === {{{ 
  if executable('latexmk')
    Plug        'lervag/vimtex'
    "" let g:tex_fast = ""
    let g:vimtex_fold_manual = 1
    if executable('zathura')
      let g:vimtex_view_method = 'zathura'
    endif
    "" let g:vimtex_matchparen_enabled = 0
    let g:vimtex_quickfix_autoclose_after_keystrokes=3
  endif
  " }}}
" === vimwiki === {{{
  Plug        'vimwiki/vimwiki'
  let wiki_markdown = {'path': '~/notes/markdown/',
                  \ 'syntax': 'markdown', 'ext': '.md',
                  \'path_html': '~/notes/markdown/html-output/'}
  let wiki_vimwiki = {'path': '~/notes/vimwiki',
              \'path_html': '~/notes/vimwiki/html-output/'}
  let g:vimwiki_list = [wiki_vimwiki, wiki_markdown]
" }}}
  " Section: Markdown
  "" Plug        'godlygeek/tabular'
  Plug        'plasticboy/vim-markdown'
  " Section: Python Takeaway
" === jupytext === {{{
  if executable('jupytext')
    Plug        'goerz/jupytext.vim'
    let g:jupytext_fmt = 'py'
  endif
" }}}
  " === flake8 === {{{
  if executable('flake8')
    Plug        'nvie/vim-flake8'
    let g:flake8_cmd = $HOME . '/.local/bin/flake8'
    let g:flake8_show_in_file=1 " show
  endif
  " }}}
  " === black === {{{
  if executable('black')
    Plug        'psf/black', {'for': 'python'}
    let g:black_virtualenv = $HOME . "/.local/pipx/venvs/black"
  endif
  " }}}
call plug#end()
