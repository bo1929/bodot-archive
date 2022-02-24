" Markdown editor settings.

setlocal spell
setlocal spelllang=en_us,tr

setlocal suffixesadd=.md

setlocal conceallevel=2

setlocal foldtext=DotFoldText()

setlocal com+=b:>

" Local settings to wrap lines.
silent call LocalWrap()
