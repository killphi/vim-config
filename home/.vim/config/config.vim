" default color scheme
set t_Co=256
set background=dark
color solarized

" don't wrap long lines
set nowrap

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

" set better width and height for viewports
set winheight=25
set winwidth=80

" Filetype options  {{{

" know .bash_aliases and .bash_functions
autocmd BufRead,BufNewFile .bash_{aliases,functions} set filetype=sh

" set foldmethod to syntax, if available
autocmd FileType * if strlen(&syntax) | set foldmethod=syntax | endif

"}}}


" local map leader
let maplocalleader = '_'

" pastetoggle! \o/
set pastetoggle=<C-b>

" Keybindings  {{{

" easy wrap toggling
nmap <Leader>w :set wrap!<cr>
nmap <Leader>W :set nowrap<cr>

" shortcut to save all
nmap <Leader>ss :wa<cr>

" close all other windows (in the current tab)
nmap gW :only<cr>

" go to the alternate file (previous buffer) with g-enter
nmap g 

" mapping the jumping between splits. Hold control while using vim nav.
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" shortcut for =>
imap <C-l> <Space>=><Space>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" use Q as gq sub
nnoremap Q gq

" select the lines which were just pasted
nnoremap vv `[V`]

" compress excess whitespace on current line
map <silent> <Leader>e :s/\v(\S+)\s+/\1 /<cr>:nohl<cr>

" delete all buffers
map <Leader>d :bufdo bd<cr>

" map spacebar to clear search highlight
nnoremap <silent> <Leader><space> :noh<cr>

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" reindent the entire file
map <Leader>I :%retab<cr>gg=G``<cr>

" insert the path of currently edited file into a command
" Command mode: Ctrl-P
cmap <C-S-P> <C-R>=expand("%:p:h") . "/" <cr>

" set imaps stuff to something unused
nnoremap <SID>I_will_not_type_this_EVER <Plug>IMAP_JumpForward

" cursorcolum/cursorline trick bindings
 map <silent> <Leader>cl      :set                  cursorline! <CR>
imap <silent> <Leader>cl <Esc>:set                  cursorline! <CR>a
 map <silent> <Leader>cc      :set   cursorcolumn!              <CR>
imap <silent> <Leader>cc <Esc>:set   cursorcolumn!              <CR>a
 map <silent> <Leader>ct      :set   cursorcolumn!  cursorline! <CR>
imap <silent> <Leader>ct <Esc>:set   cursorcolumn!  cursorline! <CR>a
 map <silent> <Leader>co      :set   cursorcolumn   cursorline  <CR>
imap <silent> <Leader>co <Esc>:set   cursorcolumn   cursorline  <CR>a
 map <silent> <Leader>cn      :set nocursorcolumn nocursorline  <CR>
imap <silent> <Leader>cn <Esc>:set nocursorcolumn nocursorline  <CR>a

"}}}


" vim:set fdm=marker:
