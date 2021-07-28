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

set number relativenumber
set spelllang=es_mx,en_us
set complete+=k
set clipboard+=unnamedplus
set ignorecase
set smartcase
set path+=**
set shortmess+=c
set cursorline
set nowrap
set termguicolors

let nroff_is_groff=1
let nroff_space_errors=1
hi def nroffDefinition term=italic cterm=italic gui=reverse
hi def nroffDefSpecial term=italic,bold cterm=italic,bold
      		 \ gui=reverse,bold
let b:preprocs_as_sections = 1
