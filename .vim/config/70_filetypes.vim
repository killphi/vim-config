" Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
  autocmd BufRead,BufNewFile {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby

" JSON is JS
  autocmd BufNewFile,BufRead *.json set ai filetype=javascript

" Markdown
  augroup mkd
    autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
  augroup END

" TMux config
  autocmd BufNewFile,BufRead .tmux.conf,tmux.conf set filetype=tmux

" Mustache
  autocmd BufNewFile,BufRead *.mustache,*.handlebars,*.hbs set filetype=mustache

" CoffeeScript
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Perl
  autocmd BufNewFile,BufRead *.pl,*.pm,*.epl,*.pll set filetype=perl


" reenable syntax highlighting
  autocmd FileType * syntax enable

" set foldmethod to syntax, if available
  autocmd FileType * if strlen(&syntax) | set foldmethod=syntax | endif
