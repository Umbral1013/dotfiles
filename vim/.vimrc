unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Breaking lines at 78 char. on plain text.
augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
augroup END

" Enable matchit if Vim can.
if has('syntax') && has('eval')
  packadd! matchit
endif

let nroff_is_groff=1
let nroff_space_errors=1
let b:preprocs_as_sections=1
" Highlight extra spacing in groff.
hi def nroffDefinition term=italic cterm=italic gui=reverse
hi def nroffDefSpecial term=italic,bold cterm=italic,bold
      		 \ gui=reverse,bold

" netrw preferences.
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize=30

" Turn ON spell checking.
nnoremap <F7> :setlocal spell spelllang=es_mx<CR>
" Turn OFF spell checking.
nnoremap <F6> :setlocal nospell<CR>

" Snippets.
nnoremap ,date :put =strftime('%c')
			\ <CR>kJ
nnoremap ,html :-1read $HOME/dotfiles/snippets/skeleton.html
			\ <CR>4jcit
nnoremap ,meta :-1read $HOME/dotfiles/snippets/metadata.txt
			\ <CR>A

" First tab shows possible completions, on the second one wildmenu appears.
set wildmode=list:longest,full

set path+=**	" Fuzzy finder.
set number relativenumber
set spelllang=es_mx,en_us
set backupcopy=auto
set complete+=k
set breakindent
set ignorecase
set smartcase
set shortmess+=c
set cursorline
set nowrap
if (has("termguicolors"))
  set termguicolors
endif
" Set Vim-specific sequences for RGB colors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" seoul256 (light):
"   Range: 252 (darkest) ~ 256 (lightest).
"   Default: 253.
"let g:seoul256_background = 255

" seoul256 (dark):
"   Range: 233 (darkest) ~ 239 (lightest).
"   Default: 237.
let g:seoul256_background = 235
colorscheme seoul256
