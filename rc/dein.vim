let g:dein#enable_notification = 1

" Required:
if dein#load_state('/Users/okamura_shimpei/.cache/dein')
  call dein#begin('/Users/okamura_shimpei/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/okamura_shimpei/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  let s:toml = '$VIMRCDIR/toml/dein.toml'
  let s:toml_lazy = '$VIMRCDIR/toml/dein.lazy.toml'
  let s:toml_nvim = '$VIMRCDIR/toml/dein.nvim.toml'
  let s:toml_nvim_lazy = '$VIMRCDIR/toml/dein.nvim.lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  if has('nvim')
    call dein#load_toml(s:toml_nvim, {})
  endif

  call dein#local('$VIMRCDIR/local')

  " Required:
  call dein#end()
  call dein#save_state()
endif
