" Vim, not Vi
set nocompatible

" Plugins
filetype off " Gets turned on later, but it screws up pathogen if it's on now
execute pathogen#infect()
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_smart_startup_focus=2

" General settings
set nofoldenable showcmd ruler number autoindent showmode autoindent showmatch
set nohidden nobackup nowritebackup noswapfile noautowrite title wrap
set noerrorbells

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
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*
"let &colorcolumn="80,".join(range(120,500),",")
let &colorcolumn="80,120"
highlight ColorColumn ctermbg=DarkGray guibg=#2c2d27

" Status line
set laststatus=2

" Make command
command! -nargs=* M make! <f-args>

" Search
set incsearch ignorecase smartcase hlsearch

" Filetypes
filetype plugin indent on

" Indents
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Mouse
set mouse=a
set nomousehide
set mousemodel=popup

" Other settings
set backspace=2
set scrolloff=10
set textwidth=0
set wrapmargin=0
set modelines=0
set clipboard=unnamedplus
set showtabline=2
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set tabpagemax=50

" Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Fix highlighting of multiline strings
autocmd BufEnter * :syntax sync fromstart

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Copy/Paste
set pastetoggle=<F2>

" Nerd Tree binds
nnoremap <C-d>      :NERDTreeFocusToggle<CR>
inoremap <C-d>      <Esc>:NERDTreeFocusToggle<CR>
nnoremap <C-f>      :NERDTreeTabsToggle<CR>
inoremap <C-f>      <Esc>:NERDTreeTabsToggle<CR>

" Escaping
map      <F1>	    <Esc>
inoremap jj         <Esc>
nnoremap <silent>   <Esc> :noh<CR><Esc>

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

" Open a bash shell
nnoremap <C-b>    :ConqueTermTab bash<CR>

" Navigation
nnoremap <Up>       <Nop>
nnoremap <Down>     <Nop>
nnoremap <Left>     <Nop>
nnoremap <Right>    <Nop>
nnoremap j          gj
nnoremap k          gk
nnoremap f			0
nnoremap g			$
inoremap <C-j>		<Down>
inoremap <C-k>      <Up>
inoremap <C-l>      <Right>
inoremap <C-h>      <Left>
inoremap <C-f>		<C-o>0
inoremap <C-g>		<C-o>$

" Make
nnoremap m			:!clear<CR>:M<CR>
nnoremap M			:!clear<CR>:M run<CR>

" Leader
let mapleader = ","
" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Edit vimrc
nnoremap <leader>e :e $MYVIMRC<CR>
" Select all
nnoremap <leader>a :%y+<CR>
" Source the current file
nnoremap <leader>s :so %<CR>
