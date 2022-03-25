let $VIMRCDIR = expand('~/.config/nvim')

let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
echo expand($CACHE)
  call mkdir(expand($CACHE), 'p')
endif

set nofoldenable

let s:data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(s:data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . s:data_dir . '/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:is_windows = has('win32') || has('win64')
let g:is_unix = has('unix')
let g:is_mac = has('mac') || has('macunix') || has('gui_macvim')
        \   || (!executable('xdg-open') && system('uname') =~? '^darwin')
        \   && !g:is_windoes

let g:python_host_prog = '/usr/bin/python'

if !exists('g:user_tmpdir')
    if g:is_windows
        let g:user_tmpdir = expand('c:/tmp/vim')
    else
        let g:user_tmpdir = expand('~/tmp/vim')
    endif
endif

function! UserTmpDir() abort
    if g:is_windows
        return expand('c:/tmp/vim')
    else
        return expand('~/tmp/vim')
    endif
endfunction

if (g:is_mac)
  autocmd InsertLeave * :call system('im-select com.apple.keylayout.ABC')
  autocmd CmdlineLeave * :call system('im-select com.apple.keylayout.ABC')
endif
