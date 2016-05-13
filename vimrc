" Vim, not Vi. Ignored by nvim.
set nocompatible

" Plugins
filetype off " Gets turned on later, but it screws up pathogen if it's on now
execute pathogen#infect()
Helptags

" Nerd tree settings
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_smart_startup_focus=2

" Nerd commenter settings
let g:NERDSpaceDelims=1
" By default, nerdcommenter uses C++ style comments for all C/C++ header files.
" These aren't valid in versions of C pre-C99 so we set custom delimiters
let g:NERDCustomDelimiters = {
	\ 'h': { 'left': '/*', 'right': '*/', 'leftAlt': '//' }
\ }

" Haskell settings
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:cabal_indent_section = 2

" Hydra settings
let g:hydra_highlight_numbers           = 1
let g:hydra_highlight_builtin_types     = 0
let g:hydra_highlight_builtin_functions = 0
let g:hydra_highlight_exceptions        = 0
let g:hydra_highlight_space_errors      = 0

" General settings
" Some settings aren't used in nvim as they're the defaults
set nofoldenable showcmd ruler number autoindent showmode showmatch
set nohidden nobackup nowritebackup noswapfile noautowrite title wrap
set noerrorbells splitbelow splitright
set spelllang=en_gb

" Gui options
if has("gui_running")
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	set guicursor=n-v-c-i:block-Cursor
	colorscheme pablo
endif

" Highlighting
filetype on
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH\ $*
let &colorcolumn="80,120"
highlight ColorColumn ctermbg=DarkGray guibg=#2c2d27

" Highlighting for other languages
au BufNewFile,BufRead *.chrd set filetype=conf
au BufNewFile,BufRead *.arc set filetype=lisp
au BufNewFile,BufRead *.nut set filetype=java " Close enough for Squirrel
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au BufNewFile,BufRead *.kisl set filetype=c
au BufNewFile,BufRead *.chs set filetype=haskell
au BufNewFile,BufRead *.ll set filetype=llvm
au BufNewFile,BufRead *.hy set filetype=hydra
au BufNewFile,BufRead *.S.h set filetype=asm
au BufNewFile,BufRead *.tex set filetype=tex " Avoid plaintex
au BufNewFile,BufRead SConstruct set filetype=python
au BufNewFile,BufRead SConscript set filetype=python

" Settings for git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Status line
set laststatus=2

" Search
set incsearch ignorecase smartcase hlsearch

" Filetypes
filetype plugin indent on

" Indents (normally use tabs)
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Use 2 spaces in haskell and lisps
autocmd FileType lisp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scheme setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Mouse
set mouse=a
set nomousehide
set mousemodel=popup

" Other settings
set backspace=2
set scrolloff=10
set modelines=0
set clipboard=unnamed
set showtabline=2
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set tabpagemax=50

" Functions for setting wrapping for text editing or code editing
function! CodeMode()
	setlocal textwidth=0
	setlocal wrapmargin=0
	setlocal nospell
endfunction

function! TextMode()
	setlocal textwidth=79
	setlocal wrapmargin=79
	setlocal spell
endfunction

" CodeMode by default
call CodeMode()

" Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Fix highlighting of multiline strings
autocmd BufEnter * :syntax sync fromstart

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Copy/Paste
set pastetoggle=<F2>

" Escaping
inoremap jj         <Esc>

" Match current bracket
nnoremap <tab>		%

" Save having to press shift all the time
nnoremap ;          :

" Tab navigation
nnoremap <C-a>      :tabprevious<CR>
nnoremap <C-z>      :tabnext<CR>
nnoremap <C-t>      :tabnew<CR>
inoremap <C-a>      <Esc>:tabprevious<CR>i
inoremap <C-z>      <Esc>:tabnext<CR>i
inoremap <C-t>      <Esc>:tabnew<CR>

" For when you forget to sudo...
cmap     w!!        w !sudo tee % >/dev/null

" Navigation
nnoremap <Up>       <Nop>
nnoremap <Down>     <Nop>
nnoremap <Left>     <Nop>
nnoremap <Right>    <Nop>
nnoremap j          gj
nnoremap k          gk
nnoremap f			0
nnoremap g			$

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clear highlighting
nnoremap \			:noh<CR>

" Leader
let mapleader = ","
" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Edit vimrc
nnoremap <leader>e :e $MYVIMRC<CR>
" Copy all
nnoremap <leader>a :%y+<CR>
" Source the current file
nnoremap <leader>s :so %<CR>
" Open a bash shell
if has('nvim')
	nnoremap <leader>b :tabnew<CR>:terminal<CR>
else
	nnoremap <leader>b :ConqueTermTab bash<CR>
endif
" Convert Current Line To Title Case
nnoremap <leader>tc :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>:noh<CR>
" Make, clean and run
nnoremap <leader>m	:!clear<CR>:! make<CR>
nnoremap <leader>n	:!clear<CR>:! make run<CR>
nnoremap <leader>v	:!clear<CR>:! make clean<CR>
" Spell suggestions
nnoremap <leader>z z=

" Change the wrap mode
nnoremap <leader>wmc :call CodeMode()<CR>
nnoremap <leader>wmt :call TextMode()<CR>

" Bool toggle
function! BoolToggle()
	let thisword = expand("<cword>")
	if thisword ==# "true"
		execute "normal! viwo\<esc>dwifalse \<esc>b"
	elseif thisword ==# "false"
		execute "normal! viwo\<esc>dwitrue \<esc>b"
	elseif thisword ==# "TRUE"
		execute "normal! viwo\<esc>dwiFALSE \<esc>b"
	elseif thisword ==# "FALSE"
		execute "normal! viwo\<esc>dwiTRUE \<esc>b"
	endif
endfunction

nnoremap ^ :call BoolToggle()<CR>
