" init.vim


" Functionality settings. {{{
" TAB.
set softtabstop=4               
set tabstop=4 
set shiftwidth=4
set expandtab

" Dictionary.
set complete+=k
set dictionary+=$HOME/dotfiles/Spanish.dic      
set spelllang=es_mx,en_us      

" Undo and backups.
set nowritebackup                               
set undofile
set nobackup
set noswapfile

" Miscellaneous.
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


" Look and feel {{{
colorscheme zenburn
set number relativenumber               
set cursorline                          
set nowrap		 	 	                
set termguicolors                       
" }}}


" Autogroups {{{
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
    " Template for regular mom documents.
    autocmd BufNewFile documento.mom
                \ :-1read $HOME/dotfiles/mom.mom
    " Documents that just contain links.
    autocmd BufNewFile enlace.mom
                \ :-1read $HOME/dotfiles/enlace.mom
    autocmd BufNewFile,BufRead *.ms,*.mom
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


" Let {{{
" Used by pydiction.
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

" Indent after an open parenthesis.
let g:pyindent_open_paren = '&sw * 2'
" Indent before a nested parenthesis.
let g:pyindent_nested_paren = '&sw'
" Indent for a continuation line.
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
 

" Key remaps {{{
" Move between folds using <alt> + hjkl
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

" Open folds using <space> key.
nnoremap <space> za
" }}}
