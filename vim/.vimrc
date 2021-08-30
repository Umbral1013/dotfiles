source $VIMRUNTIME/defaults.vim

" Breaking lines at 78 char. on plain text.
augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
augroup END

" Groff syntax highlighting.
augroup groff
  au!
  autocmd BufNewFile,BufRead *.ms,*.mom set filetype=groff
augroup END

" Enable matchit if Vim can.
if has('syntax') && has('eval')
  packadd! matchit
endif

" First tab shows possible completions, on the second one wildmenu appears.
set wildmode=list:longest,full
set number relativenumber
set spelllang=es_mx,en_us
set complete+=k
set ignorecase
set smartcase
set path+=**
set shortmess+=c
set cursorline
set nowrap
set termguicolors

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
