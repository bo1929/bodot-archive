" Leader mapping.
nnoremap <Space> <Nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" Visual select all text in buffer.
map <C-v>a ggVG

" Better yank and paste, use + register.
noremap <leader>y "+y
noremap <leader>p "+p

" Use <leader>b to toggle to the last buffer.
nnoremap <leader>b <c-^>

" Run last macro with Q.
nnoremap Q @@

" Keep pressing ~ until you get the case you want.
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Disable arrow-keys.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Clear \ register.
" As a result remove highlighting.
nnoremap \ :let @/=""<cr>
