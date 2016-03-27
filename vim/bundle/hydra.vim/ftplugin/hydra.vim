if exists("b:hydra_loaded")
  finish
endif

let b:hydra_loaded = 1

let s:cpo_save = &cpo
set cpo&vim

call nim#init()

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=s1:/*,mb:*,ex:*/,s0:/*,mb:\ ,ex:*/,:///,://!,://
setlocal commentstring=//%s
setlocal suffixesadd=.hy

let &cpo = s:cpo_save
unlet s:cpo_save
