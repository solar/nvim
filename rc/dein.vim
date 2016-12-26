let s:path = expand('$CACHE/dein')

let g:dein#enable_notification = 1
let g:dein#types#git#default_protocol = 'ssh'

if !dein#load_state(s:path)
  finish
endif

let s:toml = '$VIMRCDIR/toml/dein.toml'
let s:toml_lazy = '$VIMRCDIR/toml/dein.lazy.toml'
let s:toml_nvim = '$VIMRCDIR/toml/dein.nvim.toml'
let s:toml_nvim_lazy = '$VIMRCDIR/toml/dein.nvim.lazy.toml'

call dein#begin(s:path, [expand('<sfile>'),
      \ s:toml, s:toml_lazy, s:toml_nvim])

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:toml_lazy, {'lazy': 1})
if has('nvim')
  call dein#load_toml(s:toml_nvim, {})
endif

call dein#local('$VIMRCDIR/local')

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif
