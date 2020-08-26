"     _
"__ _(_)_ __  _ _ __
"\ V / | '  \| '_/ _|
" \_/|_|_|_|_|_| \__|

" Plugins will be downloaded under the following directory:
	call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
	Plug 'junegunn/goyo.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'arcticicestudio/nord-vim'
	Plug 'junegunn/limelight.vim'

" List ends here. Plugins become visible to Vim after this call.
	call plug#end()

" General options.
	set number relativenumber			"Display the relative line numbers below, but the current line has the absolute line number.
	syntax on
	set noswapfile
	set mouse=a
	set visualbell	                                "Blink cursor on error instead of making a demonic noise.
	set encoding=utf-8	                        "Set the encoding to UTF-8.
	set fileencoding=utf-8        			"The encoding written to file.
	set laststatus=2              			"Status bar.
	set showcmd                   			"Last line.
	set autoread	              			"Set to auto read when a file is changed from the outside.
	au FocusGained,BufEnter * checktime		"Read above :v.
	set wildmenu					"Turn on the wildmenu (autocomplete and some other cool stuff).
	set ruler					"Always show current position.
	set cmdheight=1					"Height of the command bar.
	set smartcase					"When searching, try to be smart about cases.
	set hlsearch					"Highlight search results.
	set foldcolumn=1				"Add a bit extra margin to the left.
	set ffs=unix,dos,mac				"Use Unix as the standard file type.
	set nobackup					"Turn backups off.
	set nowb					"Turn backups off.
	set noswapfile					"Turn backups off.                                  
	set wrap					"Wrap lines.
	set ignorecase					"Ignore case when searching.

" Autocommands
	autocmd BufRead *.md Goyo			"Execute Goyo when opening MarkDown files.

" Limelight options
   "Color name (:help cterm-colors) or ANSI code
	let g:limelight_conceal_ctermfg= 'DarkGray'
	let g:limelight_default_coefficient = 0.8
	autocmd! User GoyoEnter Limelight		"Integration with Goyo
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
	let g:nord_cursor_line_number_background = 1
	let g:nord_uniform_diff_background = 1
	let g:nord_bold = 1
	let g:nord_italic = 1
	let g:nord_italic_comments = 1
	let g:nord_underline = 1
	
" Choose your theme 
	set background=dark
	colorscheme nord
