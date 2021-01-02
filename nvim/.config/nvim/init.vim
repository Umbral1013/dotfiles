" init.vim


" Functionality settings -------- {{{
" TAB
set softtabstop=4               
set tabstop=4 
set shiftwidth=4
set expandtab

" Dictionary
set complete+=k                 
set dictionary+=$HOME/dotfiles/Spanish.dic      
set spelllang=es_mx,en_us      

" Undo's and backups
set nowritebackup                               
set undofile			  		            	
set nobackup			  						
set noswapfile			 						

" Miscellaneous
set foldmethod=marker
set clipboard+=unnamedplus
set smartindent                 
set smartcase			 	    
set updatetime=100              
set wildmode=list:longest,full  
set shortmess+=c                
set path+=**                    
" }}}


" Appearance settings -------- {{{
colorscheme seoul256                     
set number relativenumber               
set cursorline                          
set nowrap		 	 	                
set termguicolors                       
" }}}


" Autogroups -------- {{{
" This autogroup copies a template over any LaTeX file, sets spell for the
" document and reduces the textwidth to 70.
augroup latexHelp       
    autocmd!
    autocmd BufNewFile *.tex :-1read $HOME/dotfiles/.esqueleto.tex
    autocmd BufRead,BufNewFile *.tex
                \set spell                  
                \set textwidth=70           
augroup end

" This one copies a template over any Python file that's created, sets the
" textwidth to 79 (the recommended by pep8) and changes the fileformat to
" unix. It also uses a Google vimrc file made to make editing python files a
" bit easier.
augroup pythonHelp
    autocmd!
    autocmd BufNewFile *.py :-1read $HOME/dotfiles/.esqueleto.py
    autocmd BufNewFile,BufRead *.py
                \set textwidth=79 |
                \set filetype=unix |
                \source $HOME/dotfiles/google_python_style.vim
augroup end

" Lastly, this one is to ensure that on makefiles, when TAB is pressed the
" output is indeed a real TAB.
augroup makefileHelp
    autocmd!
    autocmd BufNewFile,BufRead Makefile,makefile set noexpandtab
augroup end
" }}}


" Let -------- {{{
" Python 
"
" This is for the pydiction plugin. Here i describe the path that should be
" used for a particular file needed for that plugin.
let g:pydiction_location = '$HOME/.local/share/nvim/site/pack/foo/start/pydiction/complete-dict'
"
" Indent after an open parenthesis
let g:pyindent_open_paren = '&sw * 2'
" Indent after a nested parenthesis
let g:pyindent_nested_paren = '&sw'
" Indent for a continuation line
let g:pyindent_continue = '&sw * 2'

" Netrw 
let g:netrw_banner = 0          
let g:netrw_liststyle = 0       
let g:netrw_browse_split = 3    
let g:netrw_winsize = 25        
 
" LaTeX 
let g:tex_nospell = 1           
let g:tex_flavor = 'latex'      
" }}}
 

" Remaps -------- {{{
" Move between splits using [ALT + Vim_keys]
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

" Open folds with SPACE key
nnoremap <space> za
" }}}
