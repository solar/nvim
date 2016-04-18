imap <C-y>     <Plug>(neosnippet_expand_or_jump)
smap <C-y>     <Plug>(neosnippet_expand_or_jump)
xmap <C-y>     <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#expand_word_boundary = 1

let g:neosnippet#snippets_directory = '$VIMRCDIR/snippets'

inoremap <silent> (( <C-r>=neosnippet#anonymous('\left(${1}\right)${0}')<CR>
