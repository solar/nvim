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

let g:is_cygwin = has('win32unix') || has('win64unix')
let g:is_windows = has('win32') || has('win64') && !g:is_cygwin
let g:is_unix = has('unix') && !g:is_cygwin
let g:is_mac = has('mac') || has('macunix') || has('gui_macvim')
        \   || (!executable('xdg-open') && system('uname') =~? '^darwin')
        \   && !g:is_windoes && !g:is_cygwin

if !exists('g:user_tmpdir')
    if g:is_cygwin
        let g:user_tmpdir = expand('~/tmp/vim')
    elseif g:is_windows
        let g:user_tmpdir = expand('c:/tmp/vim')
    else
        let g:user_tmpdir = expand('~/tmp/vim')
    endif
endif

function! UserTmpDir() abort
    if g:is_cygwin
        return expand('~/tmp/vim')
    elseif g:is_windows
        return expand('c:/tmp/vim')
    else
        return expand('~/tmp/vim')
    endif
endfunction
