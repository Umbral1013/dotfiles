"     _
"__ _(_)_ __  _ _ __
"\ V / | '  \| '_/ _|
" \_/|_|_|_|_|_| \__|

" Plugins will be downloaded under the following directory:
	call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
	Plug 'junegunn/goyo.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'junegunn/limelight.vim'
    Plug 'arcticicestudio/nord-vim'

" List ends here. Plugins become visible to Vim after this call.
	call plug#end()

" Options.
   " Appearance and feeling.
	   set number relativenumber			"Display the relative line numbers below, but the current line has the absolute line number.
	   syntax on
	   set noerrorbells 				    "No sound or visual effect if error.
	   set showcmd                   		"Last line.
	   set cursorline                       "Always show current position.
	   set cmdheight=1		  		        "Height of the command bar.
	   set hlsearch					        "Highlight search results.
	   set foldcolumn=1				        "Add a bit extra margin to the left.
       set nowrap					        "If a line goes off screen, it won't appear on the other side.
       hi CursorLine cterm=NONE ctermbg=257
	      "Replace tabs with spaces.
	      set tabstop=4 softtabstop=4
	      set shiftwidth=4
	      set expandtab

   " Functionality
	   set undodir=~/.vim/undodir			"Write the undo's in a file inside o a folder.
	   set undofile					        "The file from above.
	   set mouse=a					        "Allow mouse input.
	   set encoding=utf-8	                "Set the encoding to UTF-8.
	   set fileencoding=utf-8        		"The encoding written to file.
	   set autoread	              			"Set to auto read when a file is changed from the outside.
	   set smartcase				        "When searching, try to be smart about cases.
	   set smartindent				        "Try to be smart about indenting.
	   set ffs=unix,dos,mac				    "Use Unix as the standard file type.
	   set nobackup					        "Turn backups off.
	   set noswapfile				        "Turn swapfiles off.                                  
	   set ignorecase				        "Ignore case when searching.
	   set incsearch				        "While you're searching you get results.

" Autocommands
	autocmd BufRead *.md Goyo			    "Execute Goyo when opening MarkDown files.

" Limelight options
   "Color name (:help cterm-colors) or ANSI code
	   let g:limelight_conceal_ctermfg	= 'DarkGray'
	   let g:limelight_default_coefficient = 0.8
	   autocmd! User GoyoEnter Limelight	"Integration with Goyo
	   autocmd! User GoyoLeave Limelight!

" Gruvbox options and enable/disable.
	let g:gruvbox_bold = '1'
	let g:gruvbox_italic = '1'
	let g:gruvbox_underline = '1'
	let g:gruvbox_undercurl = '1'
	let g:gruvbox_termcolors = '1'
	let g:gruvbox_italicize_comments = '1'
	let g:gruvbox_contrast_dark = 'medium'
	let g:gruvbox_italicize_strings = '1'
	let g:gruvbox_invert_selection = '1'
	let g:gruvbox_improved_warnings = '1'
	
" Nord options to enable and disable.
	let g:nord_uniform_diff_background = 1
	let g:nord_bold = 1
	let g:nord_italic = 1
	let g:nord_italic_comments = 1
	let g:nord_underline = 1

" Choose your theme 
	set background=dark
	colorscheme nord 
