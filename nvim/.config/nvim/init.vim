"  _          _   _               _
" (_)  _ _   (_) | |_      __ __ (_)  _ __
" | | | ' \  | | |  _|  _  \ V / | | | '  \
" |_| |_||_| |_|  \__| (_)  \_/  |_| |_|_|_|
" 
"-------------------------------------------
" APPEARANCE AND FEELING.
 
colorscheme zenburn
set nu rnu                                      " Display the relative line numbers below, but the current line has the absolute line number.
set cursorline                                  " Always show current position.
set cmdheight=1		                            " Height of the command bar.
set nowrap		 	 	                        " If a line goes off screen, it won't appear on the other side.
set sc
set termguicolors                               " Set true color support."
hi CursorLine cterm=NONE ctermbg=257
" 
"-------------------------------------------
" FUNCTIONALITY
 
set complete+=k
set dictionary+=$HOME/dotfiles/Spanish.dic      " Set the route for the spanish dictionary"
set ignorecase			 						" Ignore case when searching.
set updatetime=300                              " Default is 4000 ms, this is faster.
set spelllang=es_mx,en_us
set tabstop=4 shiftwidth=4 expandtab
set wildmode=list:longest,full
set nowritebackup                               " Some servers have issues with backup files using Conquerer of Completion.
set shortmess+=c                                " Don't pass messages to ins-completion-menu
set smartindent                                 " Smart indentation.
set path+=**                                    " Search down into subfolders. Provides tab-completion for all file-related tasks.
set undofile			  		            	" The file from above.
set nobackup			  						" Turn backups off.
set noswapfile			 						" Turn swapfiles off.                                  
set foldmethod=indent                           " Automatically fold indented lines of code
set clipboard+=unnamedplus
 
"-------------------------------------------
" NETRW SETTINGS (NERDTREE-LIKE)
 
let g:netrw_banner          = 0
let g:netrw_liststyle       = 3
let g:netrw_browse_split    = 4
let g:netrw_altv            = 1
let g:netrw_winsize         = 25
 
"-------------------------------------------
" UTILITIES
 
" Writing LaTeX documents
au BufNewFile *.tex :-1read $HOME/dotfiles/.esqueleto.tex
au BufRead,BufNewFile *.tex setlocal spell
au BufNewFile,BufRead *.tex set textwidth=70
let g:tex_flavor = 'latex'

" Writing Python code
au BufNewFile *.py :-1read $HOME/dotfiles/.esqueleto.py
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix
let g:pydiction_location    = '$HOME/.local/share/nvim/site/pack/foo/start/pydiction/complete-dict'
let g:pyindent_open_paren   = 'shiftwidth() * 4'
let g:pyindent_nested_paren = 'shiftwidth()'
let g:pyindent_continue     = 'shiftwidth() * 4'

" Writing makefiles
au BufNewFile,BufRead Makefile,makefile set noexpandtab

"-------------------------------------------
" NAVIGATION

" splits

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" folding

nnoremap <space> za
