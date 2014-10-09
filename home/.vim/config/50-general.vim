" default color scheme
set t_Co=256
set background=dark
color solarized

" don't wrap long lines
set nowrap

" use 2 spaces for tabs
if !&et
  set expandtab softtabstop=2 shiftwidth=2
endif

" enable line numbers, and don't make them any wider than necessary
set number numberwidth=2

" highlight the search matches
set hlsearch

" searching is case insensitive when all lowercase
set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
set gdefault

" don't abandon buffers when unloading
set hidden

" flip the default split directions to sane ones
set splitright
set splitbelow

" don't beep for errors
set visualbell

" highlight trailing whitespace
set list

" allow lots of tabs
set tabpagemax=20

" set swap directory
set directory=~/.vim/vimswap,/tmp

" enhance viminfo
set viminfo+=r/media
set viminfo+=r/mnt
set viminfo+=r/tmp
set viminfo+=n~/.vim/viminfo

" set undo file
set undodir=~/.vim/vimundo
set undofile

" set path more sensible, duh
set path+=,,.

" reset mouse
set mouse=nv

" remember last position in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" custom fold
set foldcolumn=3
set foldmethod=indent

" helper for width between 80 and 120
set colorcolumn=80,120,121


execute "set tags+=" . resolve(expand('~/.vim/vimtags'))

" vim:set fdm=indent:
