" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
      \ 'args': [
      \   '--stdin',
      \   '--single-quote',
      \   '--trailing-comma es5',
      \ ],
      \ 'stdin': 1,
      \ }
