" _          _   _               _
"(_)  _ _   (_) | |_      __ __ (_)  _ __
"| | | ' \  | | |  _|  _  \ V / | | | '  \
"|_| |_||_| |_|  \__| (_)  \_/  |_| |_|_|_|
"
" #############
" #  OPTIONS  #
" #############
"
" Appearance and feeling.
set number                                      "Display the relative line numbers below, but the current line has the absolute line number.
syntax on
set noerrorbells	                        	"No sound or visual effect if error.
set cursorline                                  "Always show current position.
set cmdheight=1		                            "Height of the command bar.
set hlsearch		 	                        "Highlight search results.
set nowrap		 	 	                        "If a line goes off screen, it won't appear on the other side.
set noshowmode                                  "Don't show the mode you're currently in. This is useful for lightline.
hi CursorLine cterm=NONE ctermbg=257

" Functionality
set undodir=~/.cache/nvim/undodir   			"Write the undo's in a file inside o a folder.
set undofile			  		            	"The file from above.
set mouse=a			  			                "Allow mouse input.
set nobackup			  						"Turn backups off.
set noswapfile			 						"Turn swapfiles off.                                  
set ignorecase			 						"Ignore case when searching.
set incsearch			  						"While you're searching you get results.
set updatetime=300                              "Default is 4000 ms, this is faster.
set spelllang=es_mx,en_us
set tabstop=4 shiftwidth=4 expandtab
set wildmenu
set wildmode=list:longest,full
set nowritebackup                               "Some servers have issues with backup files using Conquerer of Completion.
set shortmess+=c                                "Don't pass messages to ins-completion-menu
let g:pydiction_location = '/home/alexis/.local/share/nvim/site/pack/a/start/pydiction/complete-dict'
" Nvim-only options.
set clipboard+=unnamedplus

" Gruvbox options
let g:gruvbox_bold          = '1'
let g:gruvbox_italic        = '1'
let g:gruvbox_underline     = '1'
let g:gruvbox_termcolors    = '256'
let g:gruvbox_contrast_dark = 'medium'
	
" Choose your theme 
colorscheme gruvbox
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
set background=dark

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
