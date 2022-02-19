" Markdown editor settings.

" Local settings to wrap lines.
silent call LocalWrap(80, '!;:,.?')

setlocal foldtext=MyFoldText()
setlocal spell
setlocal spelllang=en_us 
setlocal suffixesadd=.md
setlocal tabstop=4 shiftwidth=4 softtabstop=4
