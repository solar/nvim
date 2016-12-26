nmap ' <SID>[unite]

nnoremap <silent> <SID>[unite]u   :<C-u>Unite
nnoremap <silent> <SID>[unite]'   :<C-u>Unite buffer file<CR>
nnoremap <silent> <SID>[unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> <SID>[unite]H   :<C-u>Unite help<CR>
nnoremap <silent> <SID>[unite]m   :<C-u>Unite file_mru -start-insert<CR>

nnoremap <silent> <SID>[unite]j :<C-u>Unite jump<CR>

" tag jump
nnoremap <silent> <SID>[unite]T
      \ :<C-u>Unite -buffer-name=tag tag<CR>
nnoremap <silent><expr> <SID>[unite]t
      \ &filetype == 'help' ? "g\<C-]>" :
      \ ":\<C-u>UniteWithCursorWord -buffer-name=tag
      \ -immediately tag\<CR>"

" file rec
nnoremap <silent> <SID>[unite]f
      \ :<C-u>UniteWithProjectDir -buffer-name=files -no-split -ignorecase
      \ jump_point file_point file_rec/async file file/new<CR>

nnoremap <silent> <SID>[unite]g
      \ :<C-u>Unite grep
      \ -no-quit -buffer-name=grep`tabpagenr()` -auto-preview
      \ -no-empty -direction=botright<CR>
nnoremap <silent> <SID>[unite]G
      \ :<C-u>UniteWithProjectDir grep
      \ -no-quit -buffer-name=grep`tabpagenr()` -auto-preview
      \ -no-empty -direction=botright<CR>

nnoremap <silent> <SID>[unite]q   :<C-u>Unite qf -no-quit<CR>
nnoremap <silent> <SID>[unite]M   :<C-u>Unite mark<CR>
nnoremap <silent> <SID>[unite]r   :<C-u>Unite register<CR>
nnoremap <silent> <SID>[unite]w   :<C-u>Unite tab<CR>
nnoremap <silent> <SID>[unite]x   :<C-u>Unite output:message<CR>

nnoremap <silent> <SID>[unite]y
      \ :<C-u>Unite -buffer-name=register
      \ -default-action=append register history/yank<CR>
xnoremap <silent> <SID>[unite]y
      \ :<C-u>Unite -buffer-name=register
      \ -default-action=append register history/yank<CR>
