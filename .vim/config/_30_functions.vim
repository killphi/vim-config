" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " shamelessly stolen from github.com/DataWraith/vim-config

  " Abort for binary files
  if &bin | return | endif

  " Save cursor position and last search
  let save_cursor = getpos(".")
  let save_search = getreg('/')

  " Strip trailing whitespace
  %s/\s\+$//e

  " Strip empty lines at EOL
  %s/\($\n\s*\)\+\%$//e

  " Restore cursor position and search
  call setpos(".", save_cursor)
  call setreg('/', save_search)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

function! _30_functions#buffer_tags()
  if exists('b:git_dir')
    execute 'setl tags^="' . resolve(expand(b:git_dir.'/../tags')) . '"'
  endif
endfunction
