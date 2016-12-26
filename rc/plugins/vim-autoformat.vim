au MyAuto FileType scala call s:autoformat_scala()

function! s:autoformat_scala()
  nnoremap <buffer> <Space>si :<C-u>execute ':SortScalaImports' <bar> :Autoformat<CR>
endfunction

let g:formatters_scala = ['scalafmt']

let g:formatdef_scalafmt = '"scalafmt --stdin 2>/dev/null"'
