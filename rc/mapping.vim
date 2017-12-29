" <Space>g  - fugitive
" <Space>f  - vimfiler
" '         - unite
" <Space>q  - quickfix

nnoremap <C-E> g<C-]>

if has('nvim')
  nnoremap <Space>. :<C-u>edit $VIMRCDIR/init.vim<CR>
  nnoremap <Space>s. :<C-u>source $VIMRCDIR/init.vim<CR>
else
  nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
  nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
endif

" 不要なキーマップを無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" 行移動を表示優先
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" ハイライト消去
noremap <Esc><Esc> :<C-u>nohlsearch<CR>

" 最後に編集した場所
nnoremap vc `[v`]

" 移動
nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>m %

" タブページを使いやすく
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

" タグを使いやすく
nnoremap <SID>[tag] <Nop>
nmap t  <SID>[tag]
nnoremap <SID>[tag]t <C-]>
nnoremap <SID>[tag]j :<C-u>tag<CR>
nnoremap <SID>[tag]k :<C-u>pop<CR>
nnoremap <SID>[tag]l :<C-u>tags<CR>
nnoremap <SID>[tag]n :<C-u>tnext<CR>
nnoremap <SID>[tag]p :<C-u>tprev<CR>
nnoremap <SID>[tag]pt <C-w>]
nnoremap <SID>[tag]pn :<C-u>ptnext<CR>
nnoremap <SID>[tag]pp :<C-u>ptprevious<CR>

" ウィンドウ移動
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

" 挿入モードでIME状態を記憶させない
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
inoremap <silent> <C-[> <ESC>:set iminsert=0<CR>

" バッファを削除する際、ウィンドウレイアウトを維持する
:com! Bd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

" Yで行末までヤンク
nnoremap Y y$

" nvim-terminal
tnoremap <C-[> <C-\><C-n>

" Quickfix
nnoremap <Space>qn :<C-u>cnext<CR>
nnoremap <Space>qN :<C-u>cNext<CR>

" surround
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)

