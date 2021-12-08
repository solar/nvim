" set completeopt+=noinsert
" 
" let g:deoplete#disable_auto_complete = 1
" let g:deoplete#refresh_always = 1
" 
" inoremap <silent><expr> <C-j>
"      \ pumvisible() ? "\<C-n>" :
"      \ deoplete#mappings#manual_complete()
" 
" inoremap <expr><C-h>  deoplete#mappings#smart_close_popup() . "\<C-h>"
" inoremap <expr><BS>   deoplete#mappings#smart_close_popup() . "\<C-h>"
" 
" inoremap <silent><expr> deoplete#mappings#smart_close_popup() . "'"
" 
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer']
" let g:deoplete#sources.scala = ['buffer', 'file', 'tag']
" 
" let g:deoplete#sources.python = ['jedi']
" 
" autocmd MyAuto CompleteDone * if pumvisible() == 0 | pclose | endif
