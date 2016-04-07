set completeopt+=noinsert

let g:deoplete#disable_auto_complete = 1

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ deoplete#mappings#manual_complete()
inoremap <silent><expr> <C-k>
      \ pumvisible() ? "\<C-p>" :
      \ deoplete#mappings#manual_complete()

inoremap <expr><C-h>  deoplete#mappings#smart_close_popup() . "\<C-h>"
inoremap <expr><BS>   deoplete#mappings#smart_close_popup() . "\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction

inoremap <silent><expr> deoplete#mappings#smart_close_popup() . "'"

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer']
let g:deoplete#sources.scala = ['buffer', 'file', 'tag']
