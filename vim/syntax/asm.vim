" Vim syntax file
" Language:	GNU Assembler

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

syn match asmType			"byte"
syn match asmType			"word"
syn match asmType			"dword"
syn match asmType			"qword"
syn match asmType			"equ"
syn match asmType			"resb"

" syn match asmLabel			"[a-z_][a-z0-9_]*:"he=e-1
syn match asmIdentifier		"[a-z_][a-z0-9_]*"

syn match decNumber			"0\+[1-7]\=[\t\n$,; ]"
syn match decNumber			"[1-9]\d*"
syn match octNumber			"0[0-7][0-7]\+"
syn match hexNumber			"0[xX][0-9a-fA-F]\+"
syn match binNumber			"0[bB][0-1]*"

syn keyword asmTodo			contained TODO

syn region asmComment		start="/\*" end="\*/" contains=asmTodo
syn region asmComment		start="//" end="$" keepend contains=asmTodo
syn match asmComment		"[;].*" contains=asmTodo

syn match asmMacro			"%[a-z_][a-z0-9_]*"

syn match asmDirective		"\.[A-Za-z][0-9A-Za-z-_]*"
syn match asmDirective		"^[A-Za-z][0-9A-Za-z-_]*\ze:"

syn case match

hi def link asmSection		Special
hi def link asmLabel		Label
hi def link asmComment		Comment
hi def link asmTodo			Todo
hi def link asmDirective	Statement

hi def link asmInclude		Include
hi def link asmCond			PreCondit
hi def link asmMacro		Macro

hi def link hexNumber		Number
hi def link decNumber		Number
hi def link octNumber		Number
hi def link binNumber		Number

hi def link asmType			Type

let b:current_syntax = "asm"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
