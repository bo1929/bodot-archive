" Tex editor settings.
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2

" Insert a new bullet or number in the next line.
inoremap <silent><buffer> <CR> <C-]><Esc>:VimwikiReturn 3 5<CR>
" Does not insert a new list item, can create multilined list items.
inoremap <silent><buffer> <S-CR> <C-]><Esc>:VimwikiReturn 2 2<CR>
