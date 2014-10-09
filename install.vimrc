filetype off
set nocompatible

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
runtime! config/bundles.vim
call neobundle#end()

NeoBundleInstall
NeoBundleDocs
qall
