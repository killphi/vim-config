function! s:ConditionalStripWhitespace()
  let no_action_list = ['markdown']
  let i = index(no_action_list, &ft)

  if i < 0
    StripWhitespace
  endif
endfunction
command! ConditionalStripWhitespace call <SID>ConditionalStripWhitespace()

function! KILLPHI__easytags_fix_buffer_tags()
  if exists('b:git_dir')
    execute 'setl tags^="' . resolve(expand(b:git_dir).'/../tags') . '"'
  endif
endfunction
