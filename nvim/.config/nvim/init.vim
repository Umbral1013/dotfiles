" init.vim


" Ajustes de funcionalidad {{{
" TAB
set softtabstop=4               
set tabstop=4 
set shiftwidth=4
set expandtab

" Diccionario
set complete+=k                 
set dictionary+=$HOME/dotfiles/Spanish.dic      
set spelllang=es_mx,en_us      

" Deshacer y copias de respaldo
set nowritebackup                               
set undofile			  		            	
set nobackup			  						
set noswapfile			 						

" Misceláneos
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


" Ajustes de apariencia {{{
colorscheme seoul256                     
set number relativenumber               
set cursorline                          
set nowrap		 	 	                
set termguicolors                       
" }}}


" Autogrupos {{{
augroup latex       
    autocmd!
    " Copy template to newly created file.
    autocmd BufNewFile *.tex
                \ :-1read $HOME/dotfiles/.esqueleto.tex
    autocmd BufRead,BufNewFile *.tex
                \ set spell |
                \ set textwidth=70 
augroup end

    augroup pythonCode
        autocmd!
        " Copy template to newly created file.
        autocmd BufNewFile *.py
                    \ :-1read $HOME/dotfiles/.esqueleto.py
        autocmd BufNewFile,BufRead *.py
                    \ source $HOME/dotfiles/google_python_style.vim |
                    \ set textwidth=79 |
                    \ set filetype=python
    augroup end

augroup groff
    autocmd!
    autocmd BufNewFile,BufRead *.ms
                \ set spell |
                \ set textwidth=70 |
                \ set filetype=groff
augroup end

" Use real TAB on Makefiles.
augroup makefile
    autocmd!
    autocmd BufNewFile,BufRead Makefile,makefile set noexpandtab
augroup end
" }}}


" Sentencias let {{{
" Usado por pydiction
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

" Sangría después de un paréntesis abierto
let g:pyindent_open_paren = '&sw * 2'
" Sangría antes de un paréntesis anidado
let g:pyindent_nested_paren = '&sw'
" Sangría para una línea de continuación
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
 

" Reasignación de teclas {{{
" Moverse entre los dobleces usando ALT + hjkl
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

" Abrir dobleces con la tecla ESPACIO
nnoremap <space> za

" Autocompletar paréntesis, llaves, corchetes, etc.
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>0 
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
" }}}
