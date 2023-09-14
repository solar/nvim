if &compatible
  set nocompatible
endif

" Required:
" set runtimepath+=/Users/okamura_shimpei/.cache/dein/repos/github.com/Shougo/dein.vim
"
function! s:source_rc_vscode(path, ...) abort "{{{
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/.config/nvim/rc/vscode/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute printf('source %s', fnameescape(tempfile))
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction "}}}

function! s:source_rc(path, ...) abort "{{{
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/.config/nvim/rc/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute printf('source %s', fnameescape(tempfile))
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction "}}}

augroup MyAuto
  autocmd!
augroup END

if !exists('g:vscode')
  if has('vim_starting')
    call s:source_rc('init.vim')
  endif

  call s:source_rc('dein.vim')

  if !has('vim_starting')
    call dein#call_hook('source')
    call dein#call_hook('post_source')
  endif

  syntax enable
  filetype plugin indent on

  call s:source_rc('base.vim')
  call s:source_rc('mapping.vim')
  call s:source_rc('cmdwin.vim')
  call s:source_rc('terminal.vim')
else
  if has('vim_starting')
    call s:source_rc_vscode('init.vim')
  endif
  call s:source_rc_vscode('before_plug.vim')
  call s:source_rc_vscode('plug.vim')
  call s:source_rc_vscode('after_plug.vim')

  call s:source_rc('base.vim')
  call s:source_rc_vscode('mapping.vim')
endif
