" INIT.VIM

" Functionality settings -------- {{{
" TAB
set softtabstop=4               
set tabstop=4 
set shiftwidth=4
set expandtab
" Dictionary
set complete+=k                 " This is used for autocompletion
"
" A custom dictionary with spanish words
set dictionary+=$HOME/dotfiles/Spanish.dic      
"
set spelllang=es_mx,en_us       " Spell languages are spanish and english
" Undo's and backups
set nowritebackup                               
set undofile			  		            	
set nobackup			  						
set noswapfile			 						
" Miscellaneous
set clipboard+=unnamedplus      " Tell Nvim to use the system's clipboard
set smartindent                 " Indent according to the surroundings
set smartcase			 	    " When searching use case-sensitivity wisely
set updatetime=100              " Make waiting times on Nvim faster
set wildmode=list:longest,full  " Make Wildmenu more functional
set shortmess+=c                " Keep editor's messages brief
set path+=**                    " This allows fuzzy searching with the *
" }}}


" Appearance settings -------- {{{
colorscheme zenburn                     " Set the colorscheme to Zenburn
set number relativenumber               " Other lines : Relative; Current : Real number
set cursorline                          
set nowrap		 	 	                " Don't wrap my lines
set termguicolors                       " Nice colors on supported terminals
" }}}


" Autogroups -------- {{{
" This autogroup copies a template over any LaTeX file, sets spell for the
" document and reduces the textwidth to 70.
augroup latexHelp       
    autocmd!
    autocmd BufNewFile *.tex :-1read $HOME/dotfiles/.esqueleto.tex
    autocmd BufRead,BufNewFile *.tex
        \ set spell                  
        \ set textwidth=70           
augroup end

" This one copies a template over any Python file that's created, sets the
" textwidth to 79 (the recommended by pep8) and changes the fileformat to
" unix.
augroup pythonHelp
    autocmd!
    autocmd BufNewFile *.py :-1read $HOME/dotfiles/.esqueleto.py
    autocmd BufNewFile,BufRead *.py
        \ set textwidth=79
        \ set fileformat=unix
augroup end

" This group is to make folds according to the markers i've made on this file.
augroup nvimCfg
    autocmd!
    autocmd BufRead init.vim :setlocal foldmethod=marker
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
let g:netrw_banner = 0          " Removes the banner from netrw
let g:netrw_liststyle = 0       " Uses the thin listing
let g:netrw_browse_split = 3    " Open the file selected on a new tab
let g:netrw_winsize = 25        " Changes the netrw window size to 25 pixels
 
" LaTeX 
let g:tex_nospell = 1           " Don't use spell on LaTeX commands
let g:tex_flavor = 'latex'      " Use LaTeX as the preferred tex_flavor
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
