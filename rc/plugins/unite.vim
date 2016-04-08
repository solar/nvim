let g:unite_enable_auto_select = 0
let g:unite_enable_start_insert = 1
let g:unite_winheight = 32
let g:unite_data_directory = expand('$CACHE/unite')

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.unite = {
      \ 'description': 'Change file format option.'
      \ }
let g:unite_source_menu_menus.unite.command_candidates = {
      \   'directory': 'Unite -buffer-name=files ' .
      \       '-default-action=lcd directory_mru'
      \   }

" file
let g:unite_source_file_ignore_pattern = 
      \   '^\%(/\|\a\+:/\)$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$'

" file_mru
let g:unite_source_file_mru_limit = 100

" mark
let g:unite_source_mark_marks =
      \   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""

" grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --smart-case'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" rec_async
if executable('ag')
  let g:unite_source_rec_async_command =
        \ ['ag', '--vimgrep', '--hidden', '--ignore',
        \ '''.git''', '--ignore', '''.svn''', '--ignore', '''.hg''',
        \ '--ignore', '''.bzr''', '-g', '']
endif

" unite-tag
let g:unite_source_tag_max_name_length = 25
let g:unite_source_tag_max_fname_length = 130

" unite filetype
au MyAuto FileType unite call s:unite_my_settings()
function! s:unite_my_settings() abort
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction
