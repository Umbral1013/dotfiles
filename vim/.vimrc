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

" Enable hard mode by default.
" Via https://github.com/dusans/vim-hardmode#readme
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

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

" Move between buffers.
nnoremap <Leader>n <Esc>:bnext<CR>
nnoremap <Leader>p <Esc>:bprevious<CR>

" Toggle hard mode on and off.
nnoremap <leader>h <Esc>:call EasyMode()<CR>
nnoremap <leader>H <Esc>:call HardMode()<CR>

" Toggle spelling on and off.
" Via https://stackoverflow.com/a/7286397
nmap <Silent> <Leader>spell
			\ <Esc>:setlocal spelllang!=es_mx,en_us<CR>
			\ <Esc>:setlocal spell!<CR>

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
let g:netrw_browsex_viewer="xdg-open"

set title
set showmatch
set cursorline
set number relativenumber
set complete+=k
set backupcopy=auto
set smartcase
set ignorecase
set autoindent
set path+=**	" Fuzzy finder.

" Avoid all the hit-enter prompts caused by file messages, for example with
" CTRL-G, and to avoid some other messages.
" Read the Vim help file for more information.
set shortmess+=cxs

" Wrap long lines and preserve their indentation.
" Via https://retracile.net/wiki/VimBreakIndent
set wrap
let &showbreak = '+++ '
set breakindent
set linebreak

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
