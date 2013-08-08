" default color scheme
  "
  set background=light
  color solarized

" don't wrap long lines
  "
  set nowrap

" use 2 spaces for tabs
  "
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2

" enable line numbers, and don't make them any wider than necessary
  "
  set number numberwidth=2

" highlight the search matches
  "
  set hlsearch

" searching is case insensitive when all lowercase
  "
  set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
  "
  set gdefault

" don't abandon buffers when unloading
  "
  set hidden

" show current line info (current/total)
  "
  set rulerformat=%=%l/%L

" augment status line
  "
  function! ETry(function, ...)
    if exists('*'.a:function)
      return call(a:function, a:000)
    else
      return ''
    endif
  endfunction
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

" flip the default split directions to sane ones
  "
  set splitright
  set splitbelow

" don't beep for errors
  "
  set visualbell

" highlight trailing whitespace
  "
  set list

" allow lots of tabs
  "
  set tabpagemax=20

" set swap directory
  "
  set directory=~/.vimswap,/tmp

" set path more sensible, duh
  "
  set path+=,,.

" reset mouse
  "
  set mouse=nv

" remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" custom fold
  "
  set foldcolumn=3
  set foldmethod=indent

" helper for width between 80 and 120
  "
  set colorcolumn=81,121,122
