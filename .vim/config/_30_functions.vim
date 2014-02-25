function! _30_functions#buffer_tags()
  if exists('b:git_dir')
    execute 'setl tags^="' . resolve(expand(b:git_dir.'/../tags')) . '"'
  endif
endfunction
