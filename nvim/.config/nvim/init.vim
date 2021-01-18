" init.vim


" Functionality settings {{{
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
filetype plugin on
" }}}


" Appearance settings {{{
colorscheme seoul256                     
set number relativenumber               
set cursorline                          
set nowrap		 	 	                
set termguicolors                       
" }}}


" Autogroups {{{
augroup latexHelp       
    autocmd!
    " Copy template to newly created file.
    autocmd BufNewFile *.tex
                \ :-1read $HOME/dotfiles/.esqueleto.tex
    autocmd BufRead,BufNewFile *.tex
                \ set spell |
                \ set textwidth=70 
augroup end

augroup pythonHelp
    autocmd!
    " Copy template to newly created file.
    autocmd BufNewFile *.py
                \ :-1read $HOME/dotfiles/.esqueleto.py
    autocmd BufNewFile,BufRead *.py
                \ source $HOME/dotfiles/google_python_style.vim |
                \ set textwidth=79 |
                \ set filetype=unix
augroup end

" Use real TAB on Makefiles.
augroup makefileHelp
    autocmd!
    autocmd BufNewFile,BufRead Makefile,makefile set noexpandtab
augroup end
" }}}


" Let {{{
" Used for pydiction
let g:pydiction_location = 
            \'$HOME/
            \.local/
            \share/
            \nvim/
            \site/
            \pack/
            \foo/
            \start/
            \pydiction/
            \complete-dict'

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
