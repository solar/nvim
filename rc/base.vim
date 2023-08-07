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
set softtabstop=2
set shiftwidth=2
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
set guicursor=

" 編集時にファイルの存在するディレクトリに移動
au MyAuto BufEnter {?:,}/* execute ":lcd " . expand("%:p:h")

" use neovim-remote
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[4 q"
    let &t_EI .= "\<Esc>[2 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endif

if g:is_mac && executable('im-select')
  autocmd InsertLeave * :call system('im-select com.apple.keylayout.ABC')
  autocmd CmdlineLeave * :call system('im-select com.apple.keylayout.ABC')
endif
