" Vim syntax file
" Language:		Hydra
" Maintainer:	Ollie Etherington <oje@hydra-lang.org>
" Last Change:	2015 Nov 7

" PRIMARILY BASED ON NIM.VIM WITH SOME TAKEN FROM RUST.VIM
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Keep user-supplied options
if !exists("hydra_highlight_numbers")
  let hydra_highlight_numbers = 1
endif
if !exists("hydra_highlight_builtin_types")
  let hydra_highlight_builtin_types = 1
endif
if !exists("hydra_highlight_builtin_functions")
  let hydra_highlight_builtin_functions = 1
endif
if !exists("hydra_highlight_exceptions")
  let hydra_highlight_exceptions = 1
endif
if !exists("hydra_highlight_space_errors")
  let hydra_highlight_space_errors = 1
endif

if exists("hydra_highlight_all")
  let hydra_highlight_numbers           = 1
  let hydra_highlight_builtin_types     = 1
  let hydra_highlight_builtin_functions = 1
  let hydra_highlight_exceptions        = 1
  let hydra_highlight_space_errors      = 1
endif

syn region hydraBrackets       contained extend keepend matchgroup=Bold start=+\(\\\)\@<!\[+ end=+]\|$+ skip=+\\\s*$\|\(\\\)\@<!\\]+ contains=@tclCommandCluster

syn region hydraFunction	   start="`" end="`"

syn keyword hydraKeyword       addr asm atomic
syn keyword hydraKeyword       block break
syn keyword hydraKeyword       case cast continue
syn keyword hydraKeyword       do delete default
syn keyword hydraKeyword       elif else end except
syn keyword hydraKeyword       finally for from
syn keyword hydraKeyword       generic
syn keyword hydraKeyword       if import in indistinct inline
syn keyword hydraKeyword       let
syn keyword hydraKeyword       mixin
syn keyword hydraKeyword       nil
syn keyword hydraKeyword       macro template fn nextgroup=hydraFunction skipwhite
syn keyword hydraKeyword       new
syn keyword hydraKeyword       ptr
syn keyword hydraKeyword       ref return renew
syn keyword hydraKeyword       static shared
syn keyword hydraKeyword       try throw this
syn keyword hydraKeyword       uniq
syn keyword hydraKeyword       when while
syn keyword hydraKeyword       yield

syn keyword hydraStorageClass	constructor destructor enum	lambda struct mut module alias
syn keyword hydraStorageClass	instance type iterator class nextgroup=hydraFunction skipwhite

syn match   hydraFunction      "[a-z][a-zA-Z0-9_]*" contained
syn match   hydraClass         "[A-Z][a-zA-Z0-9_]*" contained
syn keyword hydraRepeat        for while
syn keyword hydraConditional   if elif else switch case when
syn keyword hydraBoolean       true false

" BEGIN TAKEN FROM RUST.VIM
syn region hydraCommentLine                                        start="//"                      end="$"   contains=hydraTodo,@Spell
syn region hydraCommentLineDoc                                     start="//\%(//\@!\|!\)"         end="$"   contains=hydraTodo,@Spell
syn region hydraCommentBlock    matchgroup=hydraCommentBlock        start="/\*\%(!\|\*[*/]\@!\)\@!" end="\*/" contains=hydraTodo,hydraCommentBlockNest,@Spell
syn region hydraCommentBlockDoc matchgroup=hydraCommentBlockDoc     start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=hydraTodo,hydraCommentBlockDocNest,@Spell
syn region hydraCommentBlockNest matchgroup=hydraCommentBlock       start="/\*"                     end="\*/" contains=hydraTodo,hydraCommentBlockNest,@Spell contained transparent
syn region hydraCommentBlockDocNest matchgroup=hydraCommentBlockDoc start="/\*"                     end="\*/" contains=hydraTodo,hydraCommentBlockDocNest,@Spell contained transparent
" FIXME: this is a really ugly and not fully correct implementation. Most
" importantly, a case like ``/* */*`` should have the final ``*`` not being in
" a comment, but in practice at present it leaves comments open two levels
" deep. But as long as you stay away from that particular case, I *believe*
" the highlighting is correct. Due to the way Vim's syntax engine works
" (greedy for start matches, unlike hydra's tokeniser which is searching for
" the earliest-starting match, start or end), I believe this cannot be solved.
" Oh you who would fix it, don't bother with things like duplicating the Block
" rules and putting ``\*\@<!`` at the start of them; it makes it worse, as
" then you must deal with cases like ``/*/**/*/``. And don't try making it
" worse with ``\%(/\@<!\*\)\@<!``, either...

syn keyword hydraTodo contained TODO FIXME XXX NB NOTE
" END TAKEN FROM RUST.VIM

" Strings
syn region hydraString start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=hydraEscape,hydraEscapeError,@Spell
syn region hydraString start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=hydraEscape,hydraEscapeError,@Spell
syn region hydraString start=+"""+ end=+"""+ keepend contains=hydraEscape,hydraEscapeError,@Spell
syn region hydraRawString matchgroup=Normal start=+[rR]"+ end=+"+ skip=+\\\\\|\\"+ contains=@Spell

syn match  hydraEscape		+\\[abfnrtv'"\\]+ contained
syn match  hydraEscape		"\\\o\{1,3}" contained
syn match  hydraEscape		"\\x\x\{2}" contained
syn match  hydraEscape		"\(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match  hydraEscape		"\\$"

syn match hydraEscapeError "\\x\x\=\X" display contained

if hydra_highlight_numbers == 1
  " numbers (including longs and complex)
  syn match   hydraNumber	"\v<0x\x+(\'(i|I|f|F|u|U)(8|16|32|64))?>"
  syn match   hydraNumber	"\v<[0-9_]+(\'(i|I|f|F|u|U)(8|16|32|64))?>"
  syn match   hydraNumber	"\v[0-9]\.[0-9_]+([eE][+-]=[0-9_]+)=>"
  syn match   hydraNumber	"\v<[0-9_]+(\.[0-9_]+)?([eE][+-]?[0-9_]+)?(\'(f|F)(32|64))?>"
endif

if hydra_highlight_builtin_types == 1
  " builtin types and objects, not really part of the syntax
  syn keyword hydraBuiltin Int Int8 Int16 Int32 Int64 Int128
  syn keyword hydraBuiltin UInt UInt8 UInt16 UInt32 UInt64 UInt128
  syn keyword hydraBuiltin Float Double Float32 Float64 Float80
  syn keyword hydraBuiltin Bool Char UChar Byte UByte String
  syn keyword hydraBuiltin Lengthable ArrayLike Ord
endif

if hydra_highlight_builtin_functions == 1
  " builtin functions, not really part of the syntax
  syn keyword hydraBuiltin Compiler neginf inf nan stdin stdout stderr assert
  syn keyword hydraBuiltin sizeof typeof getter setter
  syn keyword hydraBuiltin len clear first last append pred succ clone
  syn keyword hydraBuiltin inc dec ord chr abs min max
  syn keyword hydraBuiltin range irange
  syn match   hydraBuiltin "\<contains\>"
endif

if hydra_highlight_exceptions == 1
  " builtin exceptions and warnings
  syn keyword hydraException EBase EFormat
endif

if hydra_highlight_space_errors == 1
  " trailing whitespace
  syn match   hydraSpaceError   display excludenl "\S\s\+$"ms=s+1
endif

syn sync match hydraSync grouphere NONE "):$"
syn sync maxlines=200
syn sync minlines=2000

if version >= 508 || !exists("did_hydra_syn_inits")
  if version <= 508
    let did_hydra_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink hydraBrackets				Operator
  HiLink hydraKeyword				Keyword
  HiLink hydraStorageClass			StorageClass
  HiLink hydraFunction				Function
  HiLink hydraConditional			Conditional
  HiLink hydraRepeat				Repeat
  HiLink hydraString				String
  HiLink hydraRawString				String
  HiLink hydraBoolean				Boolean
  HiLink hydraEscape				Special
  HiLink hydraPreCondit				PreCondit
  HiLink hydraCommentLine			Comment
  HiLink hydraCommentLineDoc		Comment
  HiLink hydraCommentBlock			Comment
  HiLink hydraCommentBlockDoc		Comment
  HiLink hydraCommentBlockNest		Comment
  HiLink hydraCommentBlockDocNest	Comment
  HiLink hydraTodo					Todo
  HiLink hydraDecorator				Define

  if hydra_highlight_numbers == 1
    HiLink hydraNumber	Number
  endif

  if hydra_highlight_builtin_types == 1
    HiLink hydraBuiltin	Number
  endif

  if hydra_highlight_builtin_functions == 1
    HiLink hydraBuiltin	Number
  endif

  if hydra_highlight_exceptions == 1
    HiLink hydraException	Exception
  endif

  if hydra_highlight_space_errors == 1
    HiLink hydraSpaceError	Error
  endif

  delcommand HiLink
endif

let b:current_syntax = "hydra"
