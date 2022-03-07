" Tex editor settings.

setlocal spell
setlocal spelllang=en_us,tr

setlocal suffixesadd=.tex

setlocal conceallevel=2

" Local settings to wrap lines.
silent call LocalWrap(0, repeat(">", &shiftwidth))
