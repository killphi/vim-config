" local map leader
  let maplocalleader = '_'

" pastetoggle! \o/
  set pastetoggle=<C-b>

" easy wrap toggling
  nmap <Leader>w :set wrap!<cr>
  nmap <Leader>W :set nowrap<cr>

" shortcut to save all
  nmap <Leader>ss :wa<cr>

" close all other windows (in the current tab)
  nmap gW :only<cr>

" go to the alternate file (previous buffer) with g-enter
  nmap g 

" insert blank lines without going into insert mode
  nmap go m`o<esc>cc<esc>``
  nmap gO m`O<esc>cc<esc>``

" mapping the jumping between splits. Hold control while using vim nav.
  nmap <C-J> <C-W>j
  nmap <C-K> <C-W>k
  nmap <C-H> <C-W>h
  nmap <C-L> <C-W>l

" shortcut for =>
  imap <C-l> <Space>=><Space>

" Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

" select the lines which were just pasted
  nnoremap vv `[V`]

" compress excess whitespace on current line
  map <Leader>e :s/\v(\S+)\s+/\1 /<cr>:nohl<cr>

" delete all buffers
  map <Leader>d :bufdo bd<cr>

" map spacebar to clear search highlight
  nnoremap <Leader><space> :noh<cr>

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


" Don't use Ex mode, use Q for formatting
  map Q gq

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
