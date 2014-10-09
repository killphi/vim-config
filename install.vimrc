if has('vim_starting')
  filetype off
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
runtime! config/bundles.vim
call neobundle#end()

NeoBundleInstall
NeoBundleDocs
qall
