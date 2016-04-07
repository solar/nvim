let s:path = expand('$CACHE/dein')

let g:dein#enable_notification = 1
let g:dein#types#git#default_protocol = 'ssh'

if !dein#load_state(s:path)
  finish
endif

let s:toml = '$VIMRCDIR/toml/dein.toml'
let s:toml_lazy = '$VIMRCDIR/toml/dein.lazy.toml'
let s:toml_nvim = '$VIMRCDIR/toml/dein.nvim.toml'

call dein#begin(s:path, [expand('<sfile>'),
      \ s:toml, s:toml_lazy, s:toml_nvim])

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:toml_lazy, {'lazy': 1})
if has('nvim')
  call dein#load_toml(s:toml_nvim, {})
endif

" call dein#add('Shougo/dein.vim')
" 
" if has('nvim')
"     call dein#add('Shougo/deoplete.nvim')
" else
"     call dein#add('Shougo/neocomplete'
"     call dein#add('Shougo/neosnippet'
"     call dein#add('Shougo/neosnippet-snippets'
" endif
" 
" call dein#add('Shougo/unite.vim', {
"             \ 'lazy': 1,
"             \ 'on_cmd': ['Unite', 'UniteWithBufferDir']
"             \ })
" 
" " unite sources
" call dein#add('Shougo/vimfiler', {
"             \ 'lazy': 1,
"             \ 'on_cmd': ['VimFiler', 'VimFilerExplorer', 'Edit', 'Read',
"             \               'Source', 'Write'],
"             \ 'on_map': '<Plug>'
"             \ })
" 
" call dein#add('Shougo/neomru.vim')
" call dein#add('Shougo/unite-outline')
" call dein#add('lambdalisue/unite-grep-vcs')
" call dein#add('sgur/unite-qf')
" call dein#add('tacroe/unite-mark')
" call dein#add('tsukkee/unite-help')
" call dein#add('tsukkee/unite-tag')
" 
" call dein#add('basyura/twibill.vim')
" 
" call dein#add('tyru/open-browser.vim')
" call dein#add('basyura/TweetVim')
" 
" " textobj
" call dein#add('kana/vim-textobj-user')
" call dein#add('thinca/vim-textobj-between')
" call dein#add('rhysd/vim-textobj-anyblock')
" 
" " operator
" call dein#add('kana/vim-operator-user')
" call dein#add('rhysd/vim-operator-surround')
" 
" " colorschemes
" call dein#add('w0ng/vim-hybrid')
" 
" " filetype
" call dein#add('derekwyatt/vim-scala')
" call dein#add('groovy.vim')
" call dein#add('haproxy')
" call dein#add('nginx.vim')
" call dein#add('paulyg/Vim-PHP-Stuff')
" call dein#add('python.vim')
" call dein#add('slim-template/vim-slim')
" call dein#add('tfnico/vim-gradle')
" call dein#add('theevocater/thrift.vim')
" call dein#add('docker/docker', {
"             \ 'rtp': 'contrib/syntax/vim'
"             \ })
" call dein#add('fatih/vim-go')
" call dein#add('kchmck/vim-coffee-script')
" call dein#add('chase/vim-ansible-yaml')
" 
" " others
" call dein#add('itchyny/lightline.vim')
" call dein#add('othree/eregex.vim')
" call dein#add('Align')
" call dein#add('easymotion/vim-easymotion')
" call dein#add('thinca/vim-localrc')
" call dein#add('thinca/vim-qfreplace')
" call dein#add('tpope/vim-fugitive')
" call dein#add('tpope/vim-repeat')
" call dein#add('kannokanno/previm')
" call dein#add('xmledit')

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif
