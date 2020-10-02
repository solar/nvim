"coc

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" use <tab> for trigger completion and navigate to next complete item
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ coc#refresh()
inoremap <expr> <C-k> pumvisible() ? "\<C-n>" : "\<C-k>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gpd :<C-u>split \| normal gd<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <space>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <space>cf  <Plug>(coc-format-selected)
nmap <space>cf  <Plug>(coc-format-selected)

augroup MyGroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <space>ca  <Plug>(coc-codeaction-selected)
nmap <space>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <space>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

nmap <space>tio :<C-u>CocCommand tsserver.organizeImports<cr>
nmap <space>tii :<C-u>CocCommand prettier.formatFile<cr>

function! s:formatTs() abort
  CocCommand tsserver.organizeImports
  sleep 100m
  CocCommand prettier.formatFile
endfunction

nmap <silent> <space>tI <SID>formatTs()

" Using CocList
nnoremap <silent> <space>cl :<C-u>CocList<cr>
" Show all diagnostics
nnoremap <silent> <space>cd :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ce :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>cc :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>co :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>cs :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck :<C-u>CocPrev<CR>

nnoremap <silent> <space>cp :<C-u>CocListResume<CR>

" mru
nnoremap <silent> <space>cm :<C-u>CocList mru<cr>

nnoremap <silent> <space>cg :<C-u>CocList --interactive grep<cr>

command! -nargs=+ -complete=custom,s:GrepArgs Rg execute 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

imap <C-l> <Plug>(coc-snippets-expand)
