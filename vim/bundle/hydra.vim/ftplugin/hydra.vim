" Vim filetype plugin file
" Language:	Hydra
" Maintainer:	Ollie Etherington <ollie.etherington@gmail.com>
" Last Change:	2017 Feb 28

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Using line continuation here.
let s:cpo_save = &cpo
set cpo-=C

let b:undo_ftplugin = "setl fo< com< ofu< | if has('vms') | setl isk< | endif"

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql

" Set completion with CTRL-X CTRL-O to autoloaded function.
if exists('&ofu')
  setlocal ofu=ccomplete#Complete
endif

" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" In VMS C keywords contain '$' characters.
if has("vms")
  setlocal iskeyword+=$
endif

" When the matchit plugin is loaded, this makes the % command skip parens and
" braces in comments.
let b:match_words = &matchpairs . ',^\s*#\s*if\(\|def\|ndef\)\>:^\s*#\s*elif\>:^\s*#\s*else\>:^\s*#\s*endif\>'
let b:match_skip = 's:comment\|string\|character\|special'

" Win32 can filter files in the browse dialog
if (has("gui_win32") || has("gui_gtk")) && !exists("b:browsefilter")
  let b:browsefilter = "Hydra Source Files (*.hy)\t*.hy\n" .
    \ "All Files (*.*)\t*.*\n"
endif

let &cpo = s:cpo_save
unlet s:cpo_save
