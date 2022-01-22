" Vim, not Vi
set nocompatible

" Plugins
filetype off " Gets turned on later, but it screws up pathogen if it's on now
execute pathogen#infect()
Helptags

call plug#begin('~/.vim/plugged')
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdcommenter'
Plug 'vimwiki/vimwiki'
Plug 'neovimhaskell/haskell-vim'
Plug 'idris-hackers/idris-vim'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'editorconfig/editorconfig-vim'
Plug 'digitaltoad/vim-pug'
Plug 'ziglang/zig.vim'
Plug 'udalov/kotlin-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'godlygeek/tabular'
Plug 'purescript-contrib/purescript-vim'
Plug 'evanleck/vim-svelte'
Plug 'othree/html5.vim'
call plug#end()

" Nerd commenter settings
let g:NERDSpaceDelims=1
" By default, nerdcommenter uses C++ style comments for all C/C++ header files.
" These aren't valid in versions of C pre-C99 so we set custom delimiters
let g:NERDCustomDelimiters = {
	\ 'h': { 'left': '/*', 'right': '*/', 'leftAlt': '//' }
\ }

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/wiki', 'path_html': '~/Dropbox/wiki/html/'}]

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

" Zig
let g:zig_fmt_autosave = 1

" HTML indenting
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Make % jump between html tags
packadd! matchit

" General settings
set nofoldenable showcmd ruler norelativenumber nonumber autoindent showmode
set showmatch nohidden nobackup nowritebackup noswapfile noautowrite title wrap
set noerrorbells splitbelow splitright wildmenu lazyredraw autochdir
set spelllang=en_gb
set encoding=utf8
set ffs=unix,dos,mac

" Sane line joins
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" Files ignored for completion
set wildignore=*.o,*~,~*,*.pyc,vgcore*,*.ibc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Fix ctrl+arrows in tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

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
" let &colorcolumn="100"
let &colorcolumn="80,100"
highlight ColorColumn ctermbg=DarkGray guibg=#2c2d27

" List chars
set list
set listchars=tab:ʾ\ ,trail:•,extends:⟩,precedes:⟨
highlight SpecialKey ctermfg=DarkGrey

" Highlighting for other languages
au BufNewFile,BufRead *.h set filetype=c
au BufNewFile,BufRead *.chrd set filetype=conf
au BufNewFile,BufRead *.arc set filetype=lisp
au BufNewFile,BufRead *.nut set filetype=java " Close enough for Squirrel
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au BufNewFile,BufRead *.kisl set filetype=c
au BufNewFile,BufRead *.chs set filetype=haskell
au BufNewFile,BufRead *.ll set filetype=llvm
au BufNewFile,BufRead *.hy set filetype=hydra
au BufNewFile,BufRead *.sb set filetype=subscript
au BufNewFile,BufRead *.S.h set filetype=asm
au BufNewFile,BufRead *.tex set filetype=tex " Avoid plaintex
au BufNewFile,BufRead *.sil set filetype=tex
au BufNewFile,BufRead SConstruct set filetype=python
au BufNewFile,BufRead SConscript set filetype=python
au BufNewFile,BufRead *.ts  set filetype=typescript
au BufNewFile,BufRead *.tsx setfiletype typescript
au BufNewFile,BufRead *.inc setfiletype cpp
au BufNewFile,BufRead *.conf setfiletype conf
au BufNewFile,BufRead *.css setl sw=4 ts=4 noexpandtab
au BufNewFile,BufRead *.sass setl sw=4 ts=4 noexpandtab
au BufNewFile,BufRead *.scss setl sw=4 ts=4 noexpandtab
au BufNewFile,BufRead Tupdefault setfiletype tup

" Some files use textmode
au BufNewFile,BufRead *.wiki call TextMode()
au BufNewFile,BufRead *.txt call TextMode()

" Settings for git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Status line
set laststatus=2

" Search
set incsearch ignorecase smartcase hlsearch

" Filetypes
filetype plugin indent on

" Indents (normally use tabs)
set tabstop=4 shiftwidth=4 softtabstop=4

" Use 8 character tabs in c
autocmd FileType c setlocal tabstop=8 shiftwidth=8 softtabstop=8

" Use 2 spaces in haskell and lisps
autocmd FileType lisp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scheme setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType purescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Build commands for rust
autocmd FileType rust nnoremap <buffer> <leader>m :!cargo build<CR>
autocmd FileType rust nnoremap <buffer> <leader>n :!cargo run<CR>
autocmd FileType rust nnoremap <buffer> <leader>v :!cargo clean<CR>
autocmd FileType rust nnoremap <buffer> <leader>t :!cargo test<CR>

" Encryption
set cm=blowfish2
autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup noundofile viminfo= nobackup noshelltemp history=0 secure | endif

" Mouse
set mouse=a
set nomousehide
set mousemodel=popup

" Other settings
set backspace=2
set scrolloff=4
set modeline modelines=3
set showtabline=1
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set tabpagemax=50

" Clipboard
if has('macunix')
	set clipboard=unnamed
else
	set clipboard=unnamedplus
endif

" Persistent undo
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Functions for setting wrapping for text editing or code editing
function! CodeMode()
	setlocal textwidth=0
	setlocal wrapmargin=0
	setlocal nospell
	setlocal formatoptions=tcqj
endfunction

function! TextMode()
	setlocal textwidth=80
	setlocal wrapmargin=80
	setlocal spell
	setlocal formatoptions=want
endfunction

" CodeMode by default
call CodeMode()

" Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Fix highlighting of multiline strings
autocmd BufEnter * :syntax sync fromstart

" Remove trailing whitespace on save
if !has('macunix')
	autocmd BufWritePre * :%s/\s\+$//e
endif

" Copy/Paste
set pastetoggle=<F2>

" Escaping
inoremap jj         <Esc>

" Match current bracket
nnoremap <tab>		%

" Save having to press shift all the time
nnoremap ;          :

" Suspending ('> fg' to resume)
nnoremap <C-b>      <C-z>

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
nnoremap <leader>l :vsp<CR>
nnoremap <leader>p :sp<CR>

" Clear highlighting
nnoremap \			:noh<CR>

" Leader
let mapleader = ","
let g:mapleader = ","
" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Edit vimrc
nnoremap <leader>e :e $MYVIMRC<CR>
" Copy all
nnoremap <leader>a :%y+<CR>
" Source the current file
nnoremap <leader>s :so %<CR>
" Convert Current Line To Title Case
nnoremap <leader>c :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>:noh<CR>
" Make, clean and run
nnoremap <leader>m	:!clear<CR>:! make -j5 <CR>
nnoremap <leader>n	:!clear<CR>:! make -j5 run<CR>
nnoremap <leader>v	:!clear<CR>:! make -j5 runv<CR>
nnoremap <leader>x	:!clear<CR>:! make -j5 clean<CR>
nnoremap <leader>t	:!clear<CR>:! make -j5 test<CR>
" Spell suggestion
nnoremap <leader>z z=
" Format json
nnoremap <leader>j	:%!python -m json.tool<CR>:set ft=json<CR>
" Disable indenting
nnoremap <leader>i :setl noai nocin nosi inde=<CR>

" Change the wrap mode
nnoremap <leader>wmc :call CodeMode()<CR>
nnoremap <leader>wmt :call TextMode()<CR>
" Wrap selection
" nnoremap <leader>r g{jV}kJvgq
nnoremap <leader>r vgq

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
	elseif thisword ==# "True"
		execute "normal! viwo\<esc>dwiFalse \<esc>b"
	elseif thisword ==# "False"
		execute "normal! viwo\<esc>dwiTrue \<esc>b"
	endif
endfunction

nnoremap ^ :call BoolToggle()<CR>

" Line number toggle
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>
