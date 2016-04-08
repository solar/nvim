set t_Co=256

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'my_filename' ],
      \   ],
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ 'my_filename' ],
      \   ],
      \   'right': [
      \     [ 'fileformat', 'fileencoding', 'filetype' ],
      \   ],
      \ },
      \ 'tabline': {
      \   'left': [['tabs']],
      \   'right': [
      \     ['close'],
      \     ['git_branch',  'git_traffic',  'git_status'],
      \   ],
      \ },
      \ 'component_visible_condition': {
      \   'lineinfo': '(winwidth(0) >= 70)',
      \ },
      \ 'component_function': {
      \   'my_filename': 'g:lightline.my.filename',
      \   'git_branch': 'g:lightline.my.git_branch',
      \   'git_traffic': 'g:lightline.my.git_traffic',
      \   'git_status': 'g:lightline.my.git_status',
      \ },
      \}

let g:lightline.my = {}
function! g:lightline.my.git_branch() " {{{
  return gita#statusline#preset('branch')
endfunction " }}}

function! g:lightline.my.git_traffic() " {{{
  return gita#statusline#preset('traffic')
endfunction " }}}

function! g:lightline.my.git_status() " {{{
  return gita#statusline#preset('status')
endfunction " }}}

function! s:modified() " {{{
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' :
        \ &modifiable ? '' : '-'
endfunction " }}}

function! s:readonly() " {{{
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[R]' : ''
endfunction " }}}

function! g:lightline.my.filename() " {{{
  return ('' != s:readonly() ? s:readonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != s:modified() ? ' ' . s:modified() : '')
endfunction " }}}

autocmd MyAuto VimEnter * call lightline#enable()
