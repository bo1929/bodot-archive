" Leader mapping.
nnoremap <Space> <Nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" Select all text in buffer.
map <leader>a ggVG
map <leader>w viw

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
