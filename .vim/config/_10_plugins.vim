""" EXAMPLES
  "
  "" Original repos on github
  " NeoBundle 'tpope/vim-fugitive'
  " NeoBundle 'Lokaltog/vim-easymotion'
  " NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  "
  "" vim-scripts repos
  " NeoBundle 'L9'
  " NeoBundle 'FuzzyFinder'
  " NeoBundle 'rails.vim'
  "
  "" Non github repos
  " NeoBundle 'git://git.wincent.com/command-t.git'
  "
  "" gist repos
  " NeoBundle 'gist:Shougo/656148', {
  "       \   'name': 'everything.vim',
  "       \   'script_type': 'plugin'
  "       \ }
  "
  "" Non git repos
  " NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
  " NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'


""" Colors
  "

  " good color scheme -- http://ethanschoonover.com/solarized
    NeoBundle 'altercation/vim-colors-solarized'


""" extend standard functionality
  "

  " Build scripts
    NeoBundle 'killphi/vim-build-scripts'

  " Defaults everyone can agree on
    NeoBundle 'tpope/vim-sensible'

  " provides some utility functions and commands for programming
    NeoBundle 'L9', {
          \   'depends': 'killphi/vim-build-scripts',
          \   'build': {
          \     'unix': '../vim-build-scripts/jax.sh'
          \   }
          \ }

  " better matchit
    NeoBundle 'tsaleh/vim-matchit'

  " extensible & universal comment plugin
    NeoBundle 'tomtom/tcomment_vim'

  " wisely add 'end' in ruby, endfunction/endif/more in vim script
    NeoBundle 'tpope/vim-endwise'

  " enable repeating supported plugin maps with '.'
    NeoBundle 'tpope/vim-repeat'

  " detect indendation of files
    NeoBundle 'ciaranm/detectindent'
      let g:detectindent_preferred_expandtab = 1
      let g:detectindent_preferred_indent = 2
      autocmd VimEnter * :DetectIndent

  " Unite and create user interfaces
    NeoBundle 'Shougo/unite.vim'

  " Interactive command execution
    NeoBundle 'Shougo/vimproc', {
          \   'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \   }
          \ }

  " gundo for awesome undo tree visualization
    NeoBundle 'sjl/gundo.vim'
      map <Leader>h :GundoToggle<CR>

  " use VIm as a 3-way-merge tool
    NeoBundle 'sjl/splice.vim'

  " Perl/Ruby style regexp notation
    NeoBundle 'othree/eregex.vim', {
          \   'depends': 'killphi/vim-build-scripts',
          \   'build': {
          \     'unix': '../vim-build-scripts/jax.sh'
          \   }
          \ }
      let g:eregex_default_enable = 0
      nnoremap <leader>/ :call eregex#toggle()<CR>

  " Text objects for indented blocks of lines
    NeoBundle 'kana/vim-textobj-indent', {'depends': 'kana/vim-textobj-user'}

  " Text objects for comments
    NeoBundle 'glts/vim-textobj-comment', {'depends': 'kana/vim-textobj-user'}

  " indent motion for navigation
    NeoBundle 'indent-motion'

  " MD5 - 'nuff said
    NeoBundle 'md5.vim'

  " lean & mean statusline for vim that's light as air
    NeoBundle 'bling/vim-airline'
      let g:airline_theme = 'solarized'
      let g:airline_powerline_fonts = 1
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      let g:airline_branch_prefix = ' '
      let g:airline_readonly_symbol = ''
      let g:airline_linecolumn_prefix = ' '
      let g:airline_whitespace_symbol = 'Ξ'
      let g:airline_enable_branch = 1
      let g:airline_enable_syntastic = 1
      let g:airline_enable_tagbar = 1

  " A text object to turn foo_bar_baz into foo_baz *and* quuxSpamEggs into quuxEggs *and* shine your shoes
    NeoBundle 'Julian/vim-textobj-variable-segment', {'depends': 'kana/vim-textobj-user'}

  " Toggles between relative and absolute line numbers automatically  http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
    NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'


""" IDE functionality
  "

  " http://editorconfig.org/
    NeoBundle 'editorconfig/editorconfig-vim'

  " create cscope database and connect to existing proper database automatically
    NeoBundle 'cscope.vim'
      set nocscopetag

  " Automated tag file generation and syntax highlighting of tags
    NeoBundle 'xolox/vim-easytags', {'depends': 'xolox/vim-misc'}
      execute "set tags+=" . resolve(expand('~/.vim/vimtags'))
      let g:easytags_file = '~/.vim/vimtags'
      let g:easytags_dynamic_files = 2
      let g:easytags_by_filetype = 1
      let g:easytags_resolvelinks = 1
      let g:easytags_auto_highlight = 0
      autocmd BufEnter * call _30_functions#buffer_tags()

  " Tagbar for navigation by tags using CTags
    NeoBundle 'majutsushi/tagbar'
      let g:tagbar_autofocus = 1
      let g:tagbar_autoclose = 1
      let g:tagbar_singleclick = 1
      let g:tagbar_autoshowtag = 1

      map <Leader>. :TagbarToggle<CR>

  " NERDTree for project drawer
    NeoBundle 'scrooloose/nerdtree', {
          \ 'augroup' : 'NERDTreeHijackNetrw'
          \ }
      let NERDTreeHijackNetrw = 0
      nmap gt :NERDTreeToggle<CR>
      nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

  " vim-kompleter - super completion
    NeoBundle 'szw/vim-kompleter'

  " SuperTab for completion
    NeoBundle 'ervandew/supertab'
      let g:SuperTabDefaultCompletionType = 'context'

  " Collaborative Editing for Vim
    NeoBundle 'FredKSchott/CoVim'
      let CoVim_default_name = "killphi"
      let CoVim_default_port = "9999"


""" Convenvience
  "

  " Unimpaired for keymaps for quicky manipulating lines and files
    NeoBundle 'tpope/vim-unimpaired'
      " Bubble single lines
      nmap <C-Up> [e
      nmap <C-Down> ]e
      " Bubble multiple lines
      vmap <C-Up> [egv
      vmap <C-Down> ]egv

  " quoting/parenthesizing made simple
    NeoBundle 'tpope/vim-surround'
      " # to surround with ruby string interpolation
      let g:surround_35 = "#{\r}"
      " " - to surround with no-output erb tag
      " let g:surround_45 = '<% \r %>'
      " " = to surround with output erb tag
      " let g:surround_61 = '<%= \r %>'

  " AG aka The Silver Searcher
    NeoBundle 'rking/ag.vim'
      nmap g/ :Ag!<space>
      nmap g* :Ag! -w <C-R><C-W><space>
      nmap ga :AgAdd!<space>
      nmap gn :cnext<CR>
      nmap gp :cprev<CR>
      nmap gq :ccl<CR>
      nmap gl :cwindow<CR>

  " Tabular for aligning text
    NeoBundle 'godlygeek/tabular'
      map <Leader>a :Tabularize<space>

  " Syntastic for catching syntax errors on save
    NeoBundle 'scrooloose/syntastic'
      let g:syntastic_enable_signs=1
      let g:syntastic_quiet_messages = {'level': 'warnings'}
      " syntastic is too slow for haml and sass
      let g:syntastic_mode_map = { 'mode': 'active',
                                \ 'active_filetypes': [],
                                \ 'passive_filetypes': [ 'haml','scss','sass' ] }
      " ruby checking includes rubocop
      let g:syntastic_ruby_checkers = ['mri', 'rubocop']

  " indent guides - visually displaying indent levels in code
    NeoBundle 'nathanaelkane/vim-indent-guides'
      let g:indent_guides_enable_on_vim_startup = 1
      let g:indent_guides_start_level = 3
      let g:indent_guides_auto_colors = 0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

  " auto close brackets 'n stuff
    NeoBundle 'MartinLafreniere/vim-PairTools'
    NeoBundle 'killphi/vim-PairTools-filetypes', {'depends': 'MartinLafreniere/vim-PairTools'}

  " helpers for UNIX
    NeoBundle 'tpope/vim-eunuch'

  " :substitute preview
    NeoBundle 'osyo-manga/vim-over', {
          \   'depends': 'killphi/vim-build-scripts',
          \   'build': {
          \     'unix': '../vim-build-scripts/jax.sh'
          \   }
          \ }
      nnoremap <silent> <Leader>:s :OverCommandLine<CR>s/
      nnoremap <silent> <Leader>:% :OverCommandLine<CR>%s/
      vnoremap <silent> <Leader>:s :OverCommandLine<CR>s/

  " distraction free mode
    NeoBundle 'junegunn/goyo.vim'
      function! s:goyo_before()
        silent !tmux set status off
        set wrap
        SignifyToggle
      endfunction

      function! s:goyo_after()
        silent !tmux set status on
        set nowrap
        SignifyToggle
      endfunction

      let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
      map <silent> <leader>G :Goyo<CR>

  " Better whitespace highlighting for Vim
    NeoBundle 'ntpeters/vim-better-whitespace', { 'augroup': 'BetterWhitespace' }
    augroup BetterWhitespace
      autocmd BufWritePre <buffer> ConditionalStripWhitespace
    augroup END



  """ Snippets
    "

    " default snippets
      NeoBundle 'honza/vim-snippets'

    " Snippets for VIm
      NeoBundle 'SirVer/ultisnips'
        let g:UltiSnipsEditSplit = 'vertical'
        let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips/'


""" Language/Tool specific
  "

  """ HTML
    "

    " HTML 5 syntax & omnicomplete
      NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': 'html'}}

    " fix HTML <a> underlines of leading/trailing whitespace
      NeoBundleLazy 'html_annoyance', {'autoload': {'filetypes': 'html'}}

    " emmet.io - formerly known as ZenCode
      NeoBundle 'mattn/emmet-vim'



  """ JavaScript
    "

    " Better JS handling
      NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': 'javascript'}}

    " Coffee script
      NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': 'coffee'}}

    " JS Beautify
      NeoBundleLazy 'maksimr/vim-jsbeautify', {
            \   'autoload': {'filetypes': [ 'javascript', 'html', 'css' ]},
            \   'augroup': 'JSBeautify'
            \ }
        augroup JSBeautify
          autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
          " for html
          autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
          " for css or scss
          autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
        augroup END

    " " TypeScript
    "   NeoBundleLazy 'leafgarland/typescript-vim', {
    "         \   'autoload': {'filetypes': 'typescript'},
    "         \   'augroup': 'TypeScriptErrors'
    "         \ }
    "     augroup TypeScriptErrors
    "       autocmd QuickFixCmdPost [^l]* nested cwindow
    "       autocmd QuickFixCmdPost    l* nested lwindow
    "     augroup END
    "
    " " TypeScript Tools
    "   NeoBundleLazy 'clausreinke/typescript-tools', {
    "         \   'depends': 'leafgarland/typescript-vim',
    "         \   'autoload': {'filetypes': 'typescript'},
    "         \   'build': {
    "         \     'unix': 'sudo npm install -g'
    "         \   }
    "         \ }



  """ Templating
    "

    " Mustache & Handlebars
      NeoBundleLazy 'juvenn/mustache.vim', {'autoload': {'filetypes': 'mustache'}}

  """ Config files
    "

    " nginx.conf syntax highlighting
      NeoBundleLazy 'chase/nginx.vim', {'autoload': {'filetypes': 'nginx'}}


  """ Ruby
    "

    " this is distro bundled
    " " Vim/Ruby Configuration Files
    "   NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload': {'filetypes': [ 'ruby', 'eruby' ]}}

    " Switch Ruby versions from inside Vim
      NeoBundleLazy 'tpope/vim-rvm', {'autoload': {'filetypes': [ 'ruby', 'eruby' ]}}

    " custom text object for selecting ruby blocks
      NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {
            \   'depends': 'kana/vim-textobj-user',
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

    " Lightweight support for Ruby's Bundler'
      NeoBundleLazy 'tpope/vim-bundler', {'autoload': {'filetypes': [ 'ruby', 'eruby' ]}}

    " like rails.vim without the rails
      NeoBundleLazy 'tpope/vim-rake', {'autoload': {'filetypes': [ 'ruby', 'eruby' ]}}

    " rails.vim, nuff' said
      NeoBundle 'tpope/vim-rails', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]},
            \   'augroup': 'TPopeVimRails'
            \ }
        augroup TPopeVimRails
          autocmd FileType ruby map <Leader>oc :Rcontroller<Space>
          autocmd FileType ruby map <Leader>ov :Rview<Space>
          autocmd FileType ruby map <Leader>om :Rmodel<Space>
          autocmd FileType ruby map <Leader>oh :Rhelper<Space>
          autocmd FileType ruby map <Leader>oj :Rjavascript<Space>
          autocmd FileType ruby map <Leader>os :Rstylesheet<Space>
          autocmd FileType ruby map <Leader>oi :Rintegration<Space>
        augroup END

    " Refactoring tool for Ruby
      NeoBundleLazy 'killphi/vim-ruby-refactoring', {'autoload': {'filetypes': [ 'ruby', 'eruby' ]}}

    " " CodeQuality
    "   NeoBundleLazy 'rainerborene/vim-reek', {'autoload': {'filetypes': [ 'ruby', 'eruby' ]}}
    "   let g:reek_always_show = 0


  """ TMux
    "

    " tmux config
      NeoBundleLazy 'tsaleh/vim-tmux', {'autoload': {'filetypes': 'tmux'}}

    " tmux basics
      NeoBundle 'tpope/vim-tbone'


  """ Git
    "

    " Git runtime files
      NeoBundle 'tpope/vim-git'

    " a Git wrapper so awesome, it should be illegal
      NeoBundle 'tpope/vim-fugitive'

    " better than GitGutter
        NeoBundle 'mhinz/vim-signify'
        let g:signify_sign_overwrite = 1
        let g:signify_vcs_list = [ 'git' ]
        let g:signify_diffoptions = { 'git': '-b' }

    " TextObj SignifyHunk
      NeoBundle 'killphi/vim-textobj-signify-hunk', {'depends': [ 'kana/vim-textobj-user', 'mhinz/vim-signify' ]}


  """ Markdown
    "
      augroup MarkdownVim
        autocmd FileType markdown map <buffer> <Leader>mp :Mm<CR>
      augroup END

    " Markdown syntax highlighting
      NeoBundleLazy 'tpope/vim-markdown', {'autoload': {'filetypes': 'markdown'}}

    " Markdown preview to quickly preview markdown files
      NeoBundleLazy 'maba/vim-markdown-preview', {
            \   'autoload': {'filetypes': 'markdown'},
            \   'augroup': 'MarkdownVim'
            \ }


  """ EBNF
    "

    " ebnf syntax
      NeoBundleLazy 'killphi/vim-ebnf', {'autoload': {'filetypes': 'ebnf'}}


  """ Elixir
    "

    " configuration files for Elixir
      NeoBundleLazy 'elixir-lang/vim-elixir', {'autoload': {'filetypes': 'elixir'}}

    " snippets for Elixir
      NeoBundleLazy 'carlosgaldino/elixir-snippets', {'autoload': {'filetypes': 'elixir'}}


  """ Docker
    "

    " Dockerfile + snippets
      NeoBundleLazy 'ekalinin/Dockerfile.vim', {'autoload': {'filetypes': 'Dockerfile'}}



" " plugin name + desc
"   NeoBundle ''

" vim:set fdm=indent:
