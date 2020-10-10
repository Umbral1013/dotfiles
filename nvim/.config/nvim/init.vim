" My init.vim.
"
" Plugins will be downloaded under the following directory:
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Options.
" Appearance and feeling.
set number relativenumber                       "Display the relative line numbers below, but the current line has the absolute line number.
syntax on
set noerrorbells	                        	"No sound or visual effect if error.
set showcmd		 	                        	"Last line.
set cursorline                                  "Always show current position.
set cmdheight=1		                            "Height of the command bar.
set hlsearch		 	                        "Highlight search results.
set foldcolumn=1	                            "Add a bit extra margin to the left.
set nowrap		 	 	                        "If a line goes off screen, it won't appear on the other side.
set nowritebackup                               "Some servers have issues with backup files using Conquerer of Completion.
set shortmess+=c                                "Don't pass messages to ins-completion-menu
hi CursorLine cterm=NONE ctermbg=257

" Functionality
set undodir=~/.cache/nvim/undodir   			"Write the undo's in a file inside o a folder.
set undofile			  		            	"The file from above.
set mouse=a			  			                "Allow mouse input.
set encoding=utf-8	         		   	        "Set the encoding to UTF-8.
set fileencoding=utf-8		 			        "The encoding written to file.
set autoread			 			            "Set to auto read when a file is changed from the outside.
set smartcase			 			            "When searching, try to be smart about cases.
set smartindent			 						"Try to be smart about indenting.
set ffs=unix,dos,mac		 				    "Use Unix as the standard file type.
set nobackup			  						"Turn backups off.
set noswapfile			 						"Turn swapfiles off.                                  
set ignorecase			 						"Ignore case when searching.
set incsearch			  						"While you're searching you get results.
set tabstop=4 shiftwidth=4 expandtab
set updatetime=300                              "Default is 4000 ms, this is faster.
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
let g:gruvbox_hls_color     = 'yellow'
	
" Nord options to enable and disable.
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" Choose your theme 
autocmd vimenter * colorscheme gruvbox
set background=dark

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
