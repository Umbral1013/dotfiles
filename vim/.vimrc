"
" ~/.vimrc
"

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

if has('syntax') && has('eval')
	packadd! matchit
endif

augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=78
augroup END

" Snippets.
let mapleader=","
nnoremap <Leader>date 
			\ <Esc>:put =strftime('%c')
			\ <CR>kJ
nnoremap <Leader>html 
			\ <Esc>:-1read $HOME/dotfiles/snippets/skeleton.html
			\ <CR>4jcit
nnoremap <Leader>meta 
			\ <Esc>:-1read $HOME/dotfiles/snippets/metadata.txt
			\ <CR>A 

" Groff preferences.
let nroff_is_groff=1
let nroff_space_errors=1
let b:preprocs_as_sections=1
" Highlight extra spacing while editing a groff file.
hi def nroffDefinition
			\ term=italic
			\ cterm=italic
			\ gui=reverse
hi def nroffDefSpecial 
			\ term=italic,bold
			\ cterm=italic,bold
			\ gui=reverse,bold

" netrw preferences.
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize=30

set path+=**	" Fuzzy finder.
set number relativenumber
set spelllang=es_mx,en_us
set complete+=k
set backupcopy=auto
set breakindent
set ignorecase
set smartcase
set shortmess+=c
set cursorline
set nowrap
set title
set showmatch

" First tab shows possible completions, on the second one wildmenu appears.
set wildmode=list:longest,full

if (has("termguicolors"))
	set termguicolors
endif

" Set Vim-specific sequences for RGB colors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
colorscheme gruvbox-material
