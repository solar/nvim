function! OpenTerminalVerticalSplit() "{{{
  execute "vnew"
  execute "terminal"
  execute "startinsert"
endfunction "}}}

command! Vterm call OpenTerminalVerticalSplit()

au TermOpen * setl nonu scrollback=10000

autocmd VimResized * wincmd =
