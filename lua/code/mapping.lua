local opts = { silent = true }
local keymap = vim.keymap.set

keymap("n", ";", ":", opts)

-- reload vscode
keymap("n", "<Space>s.", "<Cmd>call VSCodeNotify('workbench.action.reloadWindow')<CR>")

-- undo/redo
keymap("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>", { silent = true})
keymap("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>", { silent = true})

-- 不要なキーマップを無効化
keymap("n", "ZZ", "<Nop>", opts)
keymap("n", "ZQ", "<Nop>", opts)
keymap("n", "Q", "<Nop>", opts)

-- 最後に編集した場所
keymap("n", "vc", "`[v`]", opts)

-- 移動
keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)
keymap("n", "<Space>m", "%", opts)

-- ウィンドウ移動
keymap("n", "sj", "<Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>", opts)
keymap("n", "sk", "<Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>", opts)
keymap("n", "sh", "<Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>", opts)
keymap("n", "sl", "<Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>", opts)
keymap("n", "sn", "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>", opts)
keymap("n", "sv", "<Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>", opts)

-- def jump
keymap("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", opts)
keymap("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>", opts)
keymap("n", "gee", "<Cmd>call VSCodeNotify('editor.action.goToDeclaration')<CR>", opts)
keymap("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>", opts)
keymap("n", "gs", "<Cmd>call VSCodeNotify('metals.goto-super-method')<CR>", opts)
keymap("n", "gpd", "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>", opts)
keymap("n", "gpt", "<Cmd>call VSCodeNotify('editor.action.peekTypeDefinition')<CR>", opts)
keymap("n", "gh", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>", opts)
keymap("n", "gpe", "<Cmd>call VSCodeNotify('editor.action.peekDeclaration')<CR>", opts)
keymap("n", "gpi", "<Cmd>call VSCodeNotify('editor.action.peekImplementation')<CR>", opts)
keymap("n", "gpp", "<Cmd>call VSCodeNotify('editor.action.togglePeekWidgetFocus')<CR>", opts)
-- keymap("n", "]m", "<Cmd>call VSCodeNotify('gotoNextPreviousMember.nextMember')<CR>", opts)
-- keymap("n", "[m", "<Cmd>call VSCodeNotify('gotoNextPreviousMember.previousMember')<CR>", opts)
keymap("n", "]e", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>", opts)
keymap("n", "[e", "<Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>", opts)
keymap("n", "gen", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>", opts)
keymap("n", "gep", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>", opts)
keymap("n", ",f", "<Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", opts)
-- keymap("n", ",q", "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>", opts)
keymap("n", ",q", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>", opts)
keymap("n", ",rr", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>", opts)
keymap("n", ",io", "<Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>", opts)
keymap("n", ",gl", "<Cmd>call VSCodeNotify('gitlens.toggleCodeLens')<CR>", opts)
keymap("n", ",tt", "<Cmd>call VSCodeNotify('testing.runCurrentFile')<CR>", opts)
keymap("n", ",tc", "<Cmd>call VSCodeNotify('testing.runAtCursor')<CR>", opts)
keymap("n", ",tl", "<Cmd>call VSCodeNotify('testing.reRunLastRun')<CR>", opts)
keymap({"x", "n", "o"}, "gc", "<Plug>VSCodeCommentary")
keymap("n", "gcc", "<Plug>VSCodeCommentaryLine")

-- other
keymap("n", "Y", "y$", opts)

keymap("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>", opts)
