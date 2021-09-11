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

" Change colorscheme depending on time of day.
if strftime("%H") >= 20
  "   Range: 233 (darkest) ~ 239 (lightest).
  "   Default: 237.
  let g:seoul256_background = 235
  set background=dark
else
  "   Range: 252 (darkest) ~ 256 (lightest).
  "   Default: 253.
  let g:seoul256_background = 255
  set background=light
endif

let nroff_is_groff=1
let nroff_space_errors=1
let b:preprocs_as_sections=1
" Highlight extra spacing in groff.
hi def nroffDefinition term=italic cterm=italic gui=reverse
hi def nroffDefSpecial term=italic,bold cterm=italic,bold
      		 \ gui=reverse,bold

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" Turn ON spell checking.
nnoremap <F7> :setlocal spell spelllang=es_mx<CR>
" Turn OFF spell checking.
nnoremap <F6> :setlocal nospell<CR>

" First tab shows possible completions, on the second one wildmenu appears.
set wildmode=list:longest,full

" <<Fuzzy finder>>.
set path+=**

set number relativenumber
set spelllang=es_mx,en_us
set complete+=k
set ignorecase
set smartcase
set shortmess+=c
set cursorline
set nowrap
if (has("termguicolors"))
  set termguicolors
endif
colorscheme seoul256
