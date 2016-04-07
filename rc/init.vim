let $LANG = "ja_JP.UTF-8"
set encoding=utf-8

let g:is_cygwin = has('win32unix') || has('win64unix')
let g:is_windows = has('win32') || has('win64')
let g:is_unix = has('unix')
let g:is_mac = has('mac') || has('macunix') || has('gui_macvim')
        \   || (!executable('xdg-open') && system('uname') =~? '^darwin')

function! IsWindows() abort
  return g:is_windows && !g:is_cygwin
endfunction

function! IsMac() abort
  return !g:is_windows && !g:is_cygwin && g:is_mac
endfunction

function! IsUnix() abort
  return g:is_unix && !g:is_cygwin
endfunction

let g:python_host_prog = '/usr/bin/python'

if !exists('g:user_tmpdir')
    if g:is_cygwin
        let g:user_tmpdir = expand('~/tmp/vim')
    elseif IsWindows()
        let g:user_tmpdir = expand('c:/tmp/vim')
    else
        let g:user_tmpdir = expand('~/tmp/vim')
    endif
endif

function! UserTmpDir() abort
    if g:is_cygwin
        return expand('~/tmp/vim')
    elseif IsWindows()
        return expand('c:/tmp/vim')
    else
        return expand('~/tmp/vim')
    endif
endfunction

let $VIMRCDIR = expand('~/.config/nvim')

let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
echo expand($CACHE)
  call mkdir(expand($CACHE), 'p')
endif

" Load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('$CACHE/dein')
          \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute ' set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif
