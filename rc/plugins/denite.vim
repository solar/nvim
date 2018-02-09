call denite#custom#option('_', {
      \ 'highlight_mode_insert': 'CursorLine',
      \ 'highlight_matched_char': 'Underlined',
      \ })

call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)


" Change matchers.
call denite#custom#source(
      \ 'file_mru', 'matchers', ['matcher_cpsm'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
