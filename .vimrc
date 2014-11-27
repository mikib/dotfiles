" FROM: mscoutermarsh
" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

set backspace=2 		" Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile 			" http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler 					" show the cursor position all the time
set showcmd 				" display incomplete commands
set incsearch 			" do incremental searching
set hlsearch 				" highlight matches
"set laststatus=2 		" Always display the status line
set autowrite 			" Automatically :write before running commands








" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>


" Color scheme
set background=dark
set encoding=utf-8


" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505
