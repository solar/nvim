nmap ' <SID>[unite]

nnoremap <silent> <SID>[unite]u   :<C-u>Unite
nnoremap <silent> <SID>[unite]'   :<C-u>Unite buffer file<CR>
nnoremap <silent> <SID>[unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> <SID>[unite]H   :<C-u>Unite help<CR>
nnoremap <silent> <SID>[unite]m   :<C-u>Unite file_mru -start-insert<CR>
nnoremap <silent> <SID>[unite]t   :<C-u>Unite tag<CR>
nnoremap <silent> <SID>[unite]T
      \   :<C-u>Unite -immediately -no-start-insert tag:<C-r>=expand('<cword>')<CR><CR>

nnoremap <silent> <SID>[unite]f
      \   :<C-u>UniteWithProjectDir -buffer-name=files -no-split
      \   jump_point file_point buffer file_rec/neovim file file/new<CR>

nnoremap <silent> <SID>[unite]g
      \   :<C-u>Unite grep -no-quit -direction=botright -buffer-name=grep-buffer<CR>
nnoremap <silent> <SID>[unite]G
      \   :<C-u>call unite#start([['grep', unite#util#path2project_directory('%')]],
      \   {'no_quit': 1, 'direction': 'botright', 'buffer-name': 'grep-buffer'})<CR>

nnoremap <silent> <SID>[unite]q   :<C-u>Unite qf -no-quit<CR>
nnoremap <silent> <SID>[unite]M   :<C-u>Unite mark<CR>
nnoremap <silent> <SID>[unite]r   :<C-u>Unite register<CR>
nnoremap <silent> <SID>[unite]w   :<C-u>Unite tab<CR>
nnoremap <silent> <SID>[unite]x   :<C-u>Unite output:message<CR>
