nnoremap <C-E> g<C-]>

if has('nvim')
  nnoremap <Space>. :<C-u>edit $VIMRCDIR/init.vim<CR>
  nnoremap <Space>s. :<C-u>source $VIMRCDIR/init.vim<CR>
else
  nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
  nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
endif

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" remove
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" clear hightlight
" noremap <Esc><Esc> :<C-u>nohlsearch<CR>

" last edited location
nnoremap vc `[v`]

" tab page
nnoremap <SID>[tab] <Nop>
nmap <C-t>  <SID>[tab]
nnoremap <SID>[tab]n :<C-u>tabnew<CR>
nnoremap <SID>[tab]c :<C-u>tabclose<CR>
nnoremap <SID>[tab]o :<C-u>tabonly<CR>
nnoremap <SID>[tab]j :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <SID>[tab]k gT
nnoremap <SID>[tab]f :<C-u>tabfirst<CR>
nnoremap <SID>[tab]h :<C-u>tabfirst<CR>
nnoremap <SID>[tab]l :<C-u>tablast<CR>
for n in range(1, 9)
  execute 'nnoremap <SID>[tab]' . n . ' :<C-u>tabnext ' . n . '<CR>'
endfor

" tabs terminal mode
tnoremap <SID>[tab] <Nop>
tmap <C-t> <SID>[tab]
tnoremap <SID>[tab]j <C-\><C-n>gt
tnoremap <SID>[tab]k <C-\><C-n>gT

" window
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sc <C-w>c
nnoremap sn <C-w>n
nnoremap sv <C-w>v
nnoremap ss <C-w>s
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sH <C-w>H
nnoremap sL <C-w>L

" don't remember IME status
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"inoremap <silent> <C-[> <ESC>:set iminsert=0<CR>

" keep window layout on deleting buffer
:com! Bd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

" yank to line ending
nnoremap Y y$

" nvim-terminal
tnoremap <C-[> <C-\><C-n>

nnoremap <space>f :<C-u>Defx<CR>
