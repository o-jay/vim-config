" Vim syntax file
" Language:		Subscript
" Maintainer:	Ollie Etherington <ollie.etherington@gmail.com>
" Last Change:	2018 Oct 22

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:ft = matchstr(&ft, '^\([^.]\)\+')

syn case match

syn keyword sbStructure		class enum struct
syn keyword sbStorageClass	fn import module
syn keyword sbStatement		ret in defer variadic using
syn keyword sbConditional	break continue case if elif else for while
syn keyword sbLabel			this implicit
syn keyword	sbTodo			contained TODO FIXME XXX NOTE TMP TEMP
syn match   sbComment		"#.*$" contains=sbTodo,@Spell
syn match	sbType			"[^a-z][A-Z][A-Za-z0-9_]*"

" String and Character constants
syn match	sbSpecial		display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match	sbSpecial		display contained "\\\(u\x\{4}\|U\x\{8}\)"
syn region	sbString		start=+\(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=sbSpecial,@Spell extend

" Integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	sbNumbers	display transparent "\<\d\|\.\d" contains=sbNumber,sbFloat,sbOctalError,sbOctal
" Same, but without octal error (for comments)
syn match	sbNumbersCom	display contained transparent "\<\d\|\.\d" contains=sbNumber,sbFloat,sbOctal
syn match	sbNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	sbNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	sbOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=sbOctalZero
syn match	sbOctalZero	display contained "\<0"
syn match	sbFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	sbFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	sbFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	sbFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
syn match	sbFloat		display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
syn match	sbFloat		display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
" flag an octal number with wrong digits
syn match	sbOctalError	display contained "0\o*[89]\d*"
syn case match

" Define the default highlighting.
hi def link sbStructure			Structure
hi def link sbStorageClass		StorageClass
hi def link sbStatement			Statement
hi def link sbConditional		Conditional
hi def link sbLabel				Label
hi def link sbTodo				Todo
hi def link sbType				Type
hi def link sbConstant			Constant
hi def link sbString			String
hi def link sbComment			Comment
hi def link sbSpecial			SpecialChar
hi def link sbCharacter			Character
hi def link sbNumber			Number
hi def link sbNumber			Number
hi def link sbOctalZero			PreProc
hi def link sbError				Error
hi def link sbRepeat			Repeat
hi def link sbFloat				Float
hi def link sbOperator			Operator
hi def link sbDefine			Macro
hi def link sbPreCondit			PreCondit

let b:current_syntax = "subscript"

unlet s:ft

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
