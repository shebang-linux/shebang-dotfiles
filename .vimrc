" Startup Settings
	filetype plugin on

	if has('syntax')
		syntax on
	endif

	let mapleader=" "
	let maplocalleader=" "

	set title
	set background=dark
	set go=ac
	set mouse=a
	set hlsearch
	set clipboard+=unnamedplus
	set fileformat=unix
	set splitbelow splitright
	set wrap
	set noerrorbells
	set smarttab
	set smartindent
	set smartcase
	set autoindent
	set nofoldenable
	set noswapfile
	set nobackup
	set incsearch
	set history=0
	set viminfofile=NONE
	set nocompatible
	set number relativenumber
	set wildmenu
	set wildmode=longest,list,full
	set wildchar=<Tab>
	set laststatus=2
	set scrolloff=4
	set showcmd
	set showmode
	set ttyfast
	set lazyredraw
	set nomodeline
	set secure
	set ffs=unix,dos,mac
	set completeopt=longest,menuone
	set complete-=i
	set spelllang=en_us,en_gb
	set esckeys
	set ruler
	set autoread
	set shortmess+=c
	set showmatch
	set noshiftround
	set nostartofline
	set nolist
	set backspace=indent,eol,start
	set linebreak
	set shm+=I
	set shell=/bin/bash

	if !has('gui_running')
	  set t_Co=256
	endif

" Center cursor when entering insert mode
	autocmd InsertEnter * norm zz

" Set F2 to auto format
	noremap <F2> gg=G<Enter>

" Set auto close tags, quotes, brackets
	inoremap " ""<Esc>i
	inoremap ' ''<Esc>i
	inoremap ` ``<Esc>i
	inoremap { {}<Esc>i
	inoremap [ []<Esc>i
	inoremap ( ()<Esc>i
	inoremap < <><Esc>i

" Set CTRL-Delete or ALT-Delete act as delete words forwards
	inoremap <C-Delete> <C-o>diw
	inoremap <M-Delete> <C-o>diw
" Set CTRL-Backspace or ALT-Backspace act as delete words backwards
	inoremap <C-Backspace> <C-w>
	inoremap <M-Backspace> <C-w>

" Set CTRL-Delete or ALT-Delete act as delete words forwards in command mode
	cnoremap <C-Delete> <C-Right><C-w>
	cnoremap <M-Delete> <C-Right><C-w>
" Set CTRL-Backspace or ALT-Backspace act as delete words backwards in command mode
	cnoremap <C-Backspace> <C-w>
	cnoremap <M-Backspace> <C-w>

" Undo/Redo are aliased to CTRL+z
	inoremap <C-z> <Esc>Ui

" Map CTRL+c in visual mode to copy to clipboard
	vnoremap <C-c> y:call system('xclip -selection clipboard', @")<Enter>
" Map CTRL+v in insert mode to paste from clipboard
	inoremap <C-v> <C-r>=system("xclip -selection clipboard -o")<Enter>

" Map Enter and Shift+Enter in normal mode to switch to insert mode when new line
	nnoremap <Enter> o
	nnoremap <S-Enter> O

" Map ALT+Backspace in normal mode to open new split window vertically
	nnoremap <M-Backspace> :vsplit .<Enter>
" Map ALT+Enter in normal mode to open new split window horizontally
	nnoremap <M-Enter> :split .<Enter>
" Map ALT +/- in normal mode to resize split window vertically
	nnoremap <M-<> :vertical resize +10<Enter>
	nnoremap <M->> :vertical resize -10<Enter>
" Map ALT =/- in normal mode to resize split window horizontally
	nnoremap <M-=> :resize +10<Enter>
	nnoremap <M--> :resize -10<Enter>

" Map navigations
	nnoremap <M-Left> <C-w>h
	nnoremap <M-Right> <C-w>l
	nnoremap <M-Up> <C-w>k
	nnoremap <M-Down> <C-w>j
	nnoremap <M-A> :bp<Enter>
	nnoremap <M-D> :bn<Enter>
	nnoremap <M-1> :bfirst<Enter>
	nnoremap <M-3> :blast<Enter>

" Map CTRL+t in normal mode to bring terminal
	nnoremap <C-t> :term<Enter>
" Map CTRL+o in normal mode to open file
	nnoremap <C-o> :edit<Space>
" Map Shift+o in normal mode to browse last modified files
	nnoremap <S-o> :bro ol!<Enter>
" Map CTRL+e in normal mode to explore working directory
	nnoremap <C-e> :e .<Enter>
" Map CTRL+d in normal mode to change working directory
	nnoremap <C-d> :lcd<Space>

" Map CTRL+s in normal mode to write file
	nnoremap <C-s> :w<Enter>
" Map CTRL+q in normal mode to quit file
	nnoremap <C-q> :q<Enter>
	nnoremap <C-z> :q<Enter>
	nnoremap <C-x> :q<Enter>
" Map CTRL+c in normal mode to force quit file
	nnoremap <C-c> :q!<Enter>

" Map CTRL+s in insert mode to write file
	inoremap <C-s> <Esc>:w<Enter>
" Map CTRL+q in insert mode to quit file
	inoremap <C-q> <Esc>:q<Enter>
	inoremap <C-x> <Esc>:q<Enter>
" Map CTRL+c in insert mode to force quit file
	inoremap <C-c> <Esc>:q!<Enter>

" Map CTRL+F in normal mode to find in files
	nnoremap <C-F> :vimgrep //g **/*<Left><Left><Left><Left><Left><Left><Left>
" Map CTRL+n and CTRL+p in normal mode to navigate in files
	nnoremap <C-n> :cn<Enter>
	nnoremap <C-p> :cp<Enter>
" Map R in normal mode to replace in files
	nnoremap R :cfdo %s///gc \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Map CTRL+r in normal mode to replace all
	nnoremap <C-r> :%s///gc<Left><Left><Left><Left>

" Map CTRL+r in insert mode to replace all
	inoremap <C-r> <Esc>:%s///gc<Left><Left><Left><Left>

" Map CTRL+Backspace to go to top
	noremap <C-Backspace> GVgg
" Map CTRL+a to go to bottom
	noremap <C-a> ggVG

" More navigation mappings
	noremap , *
	noremap ; #
	noremap <C-Up> 5k
	noremap <C-Down> 5j
	noremap <C-Left> b
	noremap <C-Right> w
	noremap <M-a> ^
	noremap <M-d> $
	vnoremap <M-Up> <C-b>
	vnoremap <M-Down> <C-f>

" Set some netrw options
	let g:netrw_banner=0       " Disable the banner
	let g:netrw_liststyle=3    " Tree view
	let g:netrw_browse_split=3 " Open files in a new tab

" Status Line
	function! BufferList()
	  let buf_list = []
	  for i in range(1, bufnr('$'))
		if buflisted(i)
		  let buf_name = bufname(i) != '' ? fnamemodify(bufname(i), ':t') : '[No Name]'
		  let buf_list += [buf_name]
		endif
	  endfor
	  return join(buf_list, ' ')
	endfunction

" Function to get search count
	function! SearchCount()
	  if v:hlsearch
	    let sc = searchcount()
	    if has_key(sc, 'current') && has_key(sc, 'total')
	      return sc.current . '/' . sc.total
	    endif
	  endif
	  return ''
	endfunction

	set statusline=%m\ %{getcwd()}/\%{BufferList()}\ %=\ %{&filetype}\ [%{&fileencoding}]\ L%l\/%L\,C%c%V\ %{SearchCount()}\ %{strftime('[%H:%M]')}

" Automatically set/unset Vim's paste mode when you paste
	let &t_SI .= "\<Esc>[?2004h"
	let &t_EI .= "\<Esc>[?2004l"

	inoremap <special> <expr> <Esc>[200~ AutoPaste()

	function! AutoPaste()
	  set pastetoggle=<Esc>[201~
	  set paste
	  return ""
	endfunction

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable
	if &diff
	  highlight! link DiffText MatchParen
	endif

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace and newlines at end of file on save & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
  	autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" When shortcut files are updated, renew bash and ranger configs with new material:
  	autocmd BufWritePost bm-files,bm-dirs !shortcuts

" Save file as root on files that require root permission
	cabbrev w! execute 'silent! write !doas tee % >/dev/null' <bar> edit!
