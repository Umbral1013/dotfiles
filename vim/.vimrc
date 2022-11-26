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

let mapleader=","

nnoremap <leader>h <Esc>:call EasyMode()<CR>
nnoremap <leader>H <Esc>:call HardMode()<CR>

nnoremap <leader>n <Esc>:bnext<CR>
nnoremap <leader>p <Esc>:bprevious<CR>

" Toggle spellcheck on and off.
" Via https://vim.fandom.com/wiki/Toggle_spellcheck_with_function_keys
nnoremap <silent> <F5>
			\ <Esc>:setlocal spell!
			\ spelllang=es_mx,en_us<CR>

" Snippets.
nnoremap <leader>date
			\ <Esc>:put =strftime('%c')
			\ <CR>kJ
nnoremap <leader>html
			\ <Esc>:-1read $HOME/dotfiles/snippets/skeleton.html
			\ <CR>4jcit
nnoremap <leader>meta
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

" netrw preferences. Check out netrw-browse-maps in the Vim help file too.
let g:netrw_browsex_viewer="/usr/bin/xdg-open"
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize=30
let g:netrw_list_hide=netrw_gitignore#Hide()

" Linter options.
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['yapf']}
let g:ale_fix_on_save = 1

set title
set showmatch
set cursorline
set number relativenumber
set complete+=k
set backupcopy=auto
set spelllang=es_mx,en_us
set smartcase
set ignorecase
set autoindent
set path+=**	" Fuzzy finder.

" Avoid all the hit-enter prompts caused by file messages, and some other
" messages.
" Read the Vim help file for more information.
set shortmess+=acs

" Wrap long lines and preserve their indentation.
" Via https://retracile.net/wiki/VimBreakIndent
set wrap
let &showbreak='+++ '
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
colorscheme seoul256
