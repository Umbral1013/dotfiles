" My init.vim.
"
" Plugins will be downloaded under the following directory:
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rkulla/pydiction'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Options.
" Appearance and feeling.
set number                                      "Display the relative line numbers below, but the current line has the absolute line number.
syntax on
set noerrorbells	                        	"No sound or visual effect if error.
set cursorline                                  "Always show current position.
set cmdheight=1		                            "Height of the command bar.
set hlsearch		 	                        "Highlight search results.
set nowrap		 	 	                        "If a line goes off screen, it won't appear on the other side.
set nowritebackup                               "Some servers have issues with backup files using Conquerer of Completion.
set shortmess+=c                                "Don't pass messages to ins-completion-menu
set noshowmode                                  "Don't show the mode you're currently in. This is useful for lightline.
hi CursorLine cterm=NONE ctermbg=257

" Functionality
set undodir=~/.cache/nvim/undodir   			"Write the undo's in a file inside o a folder.
set undofile			  		            	"The file from above.
set mouse=a			  			                "Allow mouse input.
set encoding=utf-8	         		   	        "Set the encoding to UTF-8.
set fileencoding=utf-8		 			        "The encoding written to file.
set autoread			 			            "Set to auto read when a file is changed from the outside.
set smartcase			 			            "When searching, try to be smart about cases.
set ffs=unix,dos,mac		 				    "Use Unix as the standard file type.
set nobackup			  						"Turn backups off.
set noswapfile			 						"Turn swapfiles off.                                  
set ignorecase			 						"Ignore case when searching.
set incsearch			  						"While you're searching you get results.
set updatetime=300                              "Default is 4000 ms, this is faster.
set spelllang=es_mx,en_us
set tabstop=4 shiftwidth=4 expandtab
set wildmenu
set wildmode=list:longest,full
let g:pydiction_location = '/home/alexis/.vim/plugged/pydiction/complete-dict'
" Nvim-only options.
set clipboard+=unnamedplus

" Autocommands.
autocmd BufReadPost notas.md !cp $HOME/Documentos/sync/textos1/notas/notas.md $HOME/Documentos/sync/textos1/notas/notas.md.bak

" Gruvbox options
let g:gruvbox_bold          = '1'
let g:gruvbox_italic        = '1'
let g:gruvbox_underline     = '1'
let g:gruvbox_termcolors    = '256'
let g:gruvbox_contrast_dark = 'medium'
	
" Nord options to enable and disable.
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

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
