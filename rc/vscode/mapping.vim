" <Space>g  - fugitive
" <Space>f  - vimfiler
" '         - unite
" <Space>q  - quickfix

nnoremap <C-E> g<C-]>
nnoremap ; :

nnoremap <Space>s. <Cmd>call VSCodeNotify('workbench.action.reloadWindow')<CR>

" keep undo/redo lists in sync with vscode
nmap <silent> u <cmd>call vscodenotify('undo')<cr>
nmap <silent> <c-r> <cmd>call vscodenotify('redo')<cr>

" 不要なキーマップを無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" 行移動を表示優先
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" 最後に編集した場所
nnoremap vc `[v`]

" 移動
nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>m %

" ウィンドウ移動
nnoremap sj <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap sk <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap sh <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap sl <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
nnoremap sn <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap sv <Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>

" def jump
nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
nnoremap gee <Cmd>call VSCodeNotify('editor.action.goToDeclaration')<CR>
nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap gs <Cmd>call VSCodeNotify('metals.goto-super-method')<CR>
nnoremap gpd <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
nnoremap gpt <Cmd>call VSCodeNotify('editor.action.peekTypeDefinition')<CR>
nnoremap gh <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap gpe <Cmd>call VSCodeNotify('editor.action.peekDeclaration')<CR>
nnoremap gpi <Cmd>call VSCodeNotify('editor.action.peekImplementation')<CR>
nnoremap gpp <Cmd>call VSCodeNotify('editor.action.togglePeekWidgetFocus')<CR>
nnoremap ]m <Cmd>call VSCodeNotify('gotoNextPreviousMember.nextMember')<CR>
nnoremap [m <Cmd>call VSCodeNotify('gotoNextPreviousMember.previousMember')<CR>
nnoremap ]e <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap gen <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap [e <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
nnoremap gep <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap ,f <Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>
nnoremap ,q <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
nnoremap ,rr <Cmd>call VSCodeNotify('editor.action.rename')<CR>
nnoremap ,io <Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>
nnoremap ,gl <Cmd>call VSCodeNotify('gitlens.toggleCodeLens')<CR>
nnoremap ,tt <Cmd>call VSCodeNotify('testing.runCurrentFile')<CR>
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

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

nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)

vnoremap < <gv
vnoremap > >gv

" multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)
