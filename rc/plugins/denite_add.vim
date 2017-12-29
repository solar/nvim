nmap ' <SID>[denite]

nnoremap <silent> <SID>[denite]u   :<C-u>Denite
nnoremap <silent> <SID>[denite]'   :<C-u>Denite buffer file<CR>
nnoremap <silent> <SID>[denite]b   :<C-u>Denite buffer<CR>
nnoremap <silent> <SID>[denite]H   :<C-u>Denite help<CR>
nnoremap <silent> <SID>[denite]m   :<C-u>Denite file_mru<CR>
nnoremap <silent> <SID>[denite]o  :<C-u>Denite outline<CR>

nnoremap <silent> <SID>[denite]j :<C-u>Denite jump<CR>

" file rec
nnoremap <silent> <SID>[denite]f
      \ :<C-u>DeniteProjectDir -buffer-name=files -ignorecase
      \ jump file_point file_rec file<CR>

nnoremap <silent> <SID>[denite]q   :<C-u>Denite qf -no-quit<CR>
nnoremap <silent> <SID>[denite]M   :<C-u>Denite mark<CR>
nnoremap <silent> <SID>[denite]r   :<C-u>Denite register<CR>
nnoremap <silent> <SID>[denite]w   :<C-u>Denite tab<CR>
nnoremap <silent> <SID>[denite]x   :<C-u>Denite output:message<CR>

nnoremap <silent> <SID>[denite]y
      \ :<C-u>Denite -buffer-name=register
      \ -default-action=append register history/yank<CR>
xnoremap <silent> <SID>[denite]y
      \ :<C-u>Denite -buffer-name=register
      \ -default-action=append register history/yank<CR>

" gtags
nnoremap <silent> <SID>[denite]tt :<C-u>Denite
      \ -buffer-name=gtags gtags_def<CR>
nnoremap <silent> <SID>[denite]td :<C-u>DeniteCursorWord
      \ -buffer-name=gtags gtags_def<CR>
nnoremap <silent> <SID>[denite]tr :<C-u>DeniteCursorWord
      \ -buffer-name=gtags gtags_ref<CR>
nnoremap <silent> <SID>[denite]tc :<C-u>DeniteCursorWord
      \ -buffer-name=gtags gtags_context<CR>

"grep
nnoremap <silent> <SID>[denite]gg
      \ :<C-u>DeniteCursorWord grep
      \ -buffer-name=grep`tabpagenr()` -auto-preview
      \ -no-empty -direction=botright<CR>
nnoremap <silent> <SID>[denite]gG
      \ :<C-u>DeniteProjectDir grep
      \ -buffer-name=grep`tabpagenr()` -auto-preview
      \ -no-empty -direction=botright<CR>
nnoremap <silent> <SID>[denite]gr :<C-u>Denite -resume -auto-preview
      \ -buffer-name=grep`tabpagenr()` -no-empty<CR>
nnoremap <silent> <SID>[denite]gn :<C-u>Denite -resume
      \ -buffer-name=grep`tabpagenr()` -immediately -select=+1 -no-empty<CR>
nnoremap <silent> <SID>[denite]gp :<C-u>Denite -resume
      \ -buffer-name=grep`tabpagenr()` -immediately -select=-1 -no-empty<CR>
