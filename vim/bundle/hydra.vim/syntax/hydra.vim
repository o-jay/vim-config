" Vim syntax file
" Language:		Hydra
" Maintainer:	Ollie Etherington <ollie.etherington@gmail.com>
" Last Change:	2018 Jan 04

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:ft = matchstr(&ft, '^\([^.]\)\+')

syn case match

syn keyword hyStructure		class enum struct
syn keyword hyStorageClass	fn impl import module ccall volatile
syn keyword hyStatement		ret let in defer variadic using asm
syn keyword hyConditional	break continue case if elif else for while
syn keyword hyLabel			ref this implicit mut
syn keyword	hyTodo			contained TODO FIXME XXX NOTE TMP
syn match   hyComment		"#.*$" contains=hyTodo,@Spell
syn match	hyType			"[^a-z][A-Z][A-Za-z0-9_]*"

" String and Character constants
syn match	hySpecial		display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match	hySpecial		display contained "\\\(u\x\{4}\|U\x\{8}\)"
syn region	hyString		start=+\(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=hySpecial,@Spell extend

" Integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	hyNumbers	display transparent "\<\d\|\.\d" contains=hyNumber,hyFloat,hyOctalError,hyOctal
" Same, but without octal error (for comments)
syn match	hyNumbersCom	display contained transparent "\<\d\|\.\d" contains=hyNumber,hyFloat,hyOctal
syn match	hyNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	hyNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	hyOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=hyOctalZero
syn match	hyOctalZero	display contained "\<0"
syn match	hyFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	hyFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	hyFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	hyFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
syn match	hyFloat		display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
syn match	hyFloat		display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
" flag an octal number with wrong digits
syn match	hyOctalError	display contained "0\o*[89]\d*"
syn case match

" Define the default highlighting.
hi def link hyStructure			Structure
hi def link hyStorageClass		StorageClass
hi def link hyStatement			Statement
hi def link hyConditional		Conditional
hi def link hyLabel				Label
hi def link hyTodo				Todo
hi def link hyType				Type
hi def link hyConstant			Constant
hi def link hyString			String
hi def link hyComment			Comment
hi def link hySpecial			SpecialChar
hi def link hyCharacter			Character
hi def link hyNumber			Number
hi def link hyNumber			Number
hi def link hyOctalZero			PreProc
hi def link hyError				Error
hi def link hyRepeat			Repeat
hi def link hyFloat				Float
hi def link hyOperator			Operator
hi def link hyDefine			Macro
hi def link hyPreCondit			PreCondit

let b:current_syntax = "hydra"

unlet s:ft

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
