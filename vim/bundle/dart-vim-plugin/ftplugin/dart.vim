if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" I commented this out because a man who fucks with my indent settings
" is a man who wants to die...
" Enable automatic indentation (2 spaces)
"setlocal expandtab
"setlocal shiftwidth=2
"setlocal softtabstop=2

"setlocal formatoptions-=t

" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

setlocal commentstring=//%s
let s:win_sep = (has('win32') || has('win64')) ? '/' : ''
let &l:errorformat =
  \ join([
  \   ' %#''file://' . s:win_sep . '%f'': %s: line %l pos %c:%m',
  \   '%m'
  \ ], ',')


let b:undo_ftplugin = 'setl et< fo< sw< sts< com< cms<'
