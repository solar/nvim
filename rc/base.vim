set modeline
set iminsert=0
set imsearch=0
set history=100

set cmdheight=2

let &directory=UserTmpDir()

set incsearch
set ignorecase
set smartcase
set nohlsearch

set autoindent
set smartindent
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set wrapscan
set wildmenu
set tags=tags;
set formatoptions&
set formatoptions+=mM

set backup
let &backupdir=g:user_tmpdir . '/backup'

let &undodir=g:user_tmpdir . '/undo'

set showmatch
let loaded_matchparen = 1

set number
set ruler
set list
set listchars=tab:>-,trail:-
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set virtualedit+=block
set winwidth=30
set winminwidth=30
set pvh=26

set foldmethod=marker
set foldopen=hor
set foldclose=

set showtabline=2

set maxfuncdepth=200
