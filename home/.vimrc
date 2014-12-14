if has('vim_starting')
  filetype off
  set nocompatible

  " Vim does not play well with fish
  if &shell =~# 'fish$'
    set shell=/bin/bash
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundles
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
runtime! config/bundles.vim

call neobundle#end()

filetype plugin indent on

" Installation check.
NeoBundleCheck

" runtime config
runtime! config/*config.vim
