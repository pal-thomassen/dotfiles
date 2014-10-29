set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vundle help
" -----------
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

Bundle 'kien/ctrlp.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'chriskempson/base16-vim'
Bundle 'junegunn/goyo.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
Bundle 'mileszs/ack.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'groenewege/vim-less'

" My setup
" --------

syntax on " turn on syntax highlighting

set nomodeline
set encoding=utf-8

set nofoldenable    " disable folding

if version >= 703
  set relativenumber " show relative numbers
else
  set number " show line numbers
endif

set ruler " show current position at bottom

set autoread " watch for file changes

" cd into current file's directory
if exists("+autochdir")
  set autochdir
endif

" don't redraw when don't have to, e.g. when running macros
set lazyredraw

" Show partial commands
set showcmd

" support all three newline formats
set fileformats=unix,dos,mac

" Lines around caret
set scrolloff=3

" Shut up
set noerrorbells visualbell t_vb= " don't whine

" Keep undo history across sessions
if exists("+undofile")
  set undodir=~/.vim/backups
  set undofile
endif

" Whitespace stuff
set nowrap        " don't soft wrap long lines
set tabstop=2     " spaces per tab
set shiftwidth=2  " characters to indent
set softtabstop=2 " make spaces feel like tabs
set expandtab     " insert space on tab
"set list          " show invisible characters
"set listchars=tab:>·,trail:· " ... but only show tabs and trailing whitespace

" Searching
set hlsearch   " highlight searched expressions
set incsearch  " incremental searching
set ignorecase " case insensitive
set smartcase  " ... unless there's a capital letter

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" automagic indentation
set autoindent
set nocindent
set nosmartindent

" always show the status line
set laststatus=2

" Easy split window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <D-i> :NERDTree<CR>

" Press Space to dismiss highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" Map Goyo
nnoremap <Leader>g :Goyo<CR>  

" Keep search matches in the middle of the window and pulse the line when
" moving to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" File types
filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" Removes trailing spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <Leader>s :call <SID>StripTrailingWhitespaces()<CR>

