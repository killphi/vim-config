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
  "   \ 'name': 'everything.vim',
  "   \ 'script_type': 'plugin'}
  "
  "" Non git repos
  " NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
  " NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'


""" Colors
  "

  " good color scheme -- http://ethanschoonover.com/solarized
    NeoBundle 'altercation/vim-colors-solarized'


""" extend standard funcitonality
  "

  " Defaults everyone can agree on
    NeoBundle 'tpope/vim-sensible'

  " provides some utility functions and commands for programming
    NeoBundle 'L9'

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
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

  " gundo for awesome undo tree visualization
    NeoBundle 'sjl/gundo.vim'
      map <Leader>h :GundoToggle<CR>

  " use VIm as a 3-way-merge tool
    NeoBundle 'sjl/splice.vim'

  " Perl/Ruby style regexp notation
    NeoBundle 'othree/eregex.vim'
      let g:eregex_default_enable = 0
      nnoremap <leader>/ :call eregex#toggle()<CR>

  " defines a new text object representing lines of code at the same indent level
    NeoBundle 'michaeljsmith/vim-indent-object'

  " indent motion for navigation
    NeoBundle 'indent-motion'


""" IDE functionality
  "

  " Tagbar for navigation by tags using CTags
    NeoBundle 'majutsushi/tagbar'
      let g:tagbar_autofocus = 1
      map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
      map <Leader>. :TagbarToggle<CR>

  " NERDTree for project drawer
    NeoBundle 'scrooloose/nerdtree', { 'augroup' : 'NERDTreeHijackNetrw'}
      let NERDTreeHijackNetrw = 0
      nmap gt :NERDTreeToggle<CR>
      nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

  " vim-kompleter - super completion
    NeoBundle 'szw/vim-kompleter'

  " SuperTab for completion
    NeoBundle 'ervandew/supertab'
      let g:SuperTabDefaultCompletionType = 'context'


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
      " let g:surround_35 = '#{\r}'
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
      let g:syntastic_quiet_warnings=1
      " syntastic is too slow for haml and sass
      let g:syntastic_mode_map = { 'mode': 'active',
                                \ 'active_filetypes': [],
                                \ 'passive_filetypes': ['haml','scss','sass'] }

  " indentLines - mark indendation
    NeoBundle 'Yggdroot/indentLine'

  " auto close brackets 'n stuff
    NeoBundle 'MartinLafreniere/vim-PairTools'

  " helpers for UNIX
    NeoBundle 'tpope/vim-eunuch'


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


  """ CSS
    "

    " Highlight colors in css files
      NeoBundleLazy 'skammer/vim-css-color', {'autoload': {'filetypes': [ 'javascript', 'html', 'css' ]}}


  """ JavaScript
    "

    " better JS indent
      NeoBundleLazy 'Javascript-Indentation', {'depends': 'IndentAnything', 'autoload': {'filetypes': 'javascript'}}

    "
      NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': 'javascript'}, 'build': {'unix': 'rm -rf indent; git commit -am "remove indentation"'}}

    " Coffee script
      NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': 'coffee'}}


  """ Templating
    "

    " Mustache
      NeoBundleLazy 'juvenn/mustache.vim', {'autoload': {'filetypes': 'mustache'}}

  """ Config files
    "

    " nginx.conf syntax highlighting
      NeoBundleLazy 'chase/nginx.vim', {'autoload': {'filetypes': 'nginx'}}


  """ Ruby
    "

    " Vim/Ruby Configuration Files
      NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload': {'filetypes': ['ruby', 'rails']}}

    " custom text object for selecting ruby blocks
      NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {'depends': 'kana/vim-textobj-user', 'autoload': {'filetypes': ['ruby', 'rails']}}

    " Ruby MatchIt
      NeoBundleLazy 'ruby-matchit', {'autoload': {'filetypes': ['ruby', 'rails']}}

    " Lightweight support for Ruby's Bundler'
      NeoBundleLazy 'tpope/vim-bundler', {'autoload': {'filetypes': ['ruby', 'rails']}}

    " like rails.vim without the rails
      NeoBundleLazy 'tpope/vim-rake', {'autoload': {'filetypes': ['ruby', 'rails']}}

    " rails.vim, nuff' said
      NeoBundleLazy 'tpope/vim-rails', {'autoload': {'filetypes': 'rails'}, 'augroup': 'TPopeVimRails'}
        augroup TPopeVimRails
          autocmd FileType rails map <Leader>oc :Rcontroller<Space>
          autocmd FileType rails map <Leader>ov :Rview<Space>
          autocmd FileType rails map <Leader>om :Rmodel<Space>
          autocmd FileType rails map <Leader>oh :Rhelper<Space>
          autocmd FileType rails map <Leader>oj :Rjavascript<Space>
          autocmd FileType rails map <Leader>os :Rstylesheet<Space>
          autocmd FileType rails map <Leader>oi :Rintegration<Space>
        augroup END

    " Refactoring tool for Ruby
      NeoBundleLazy 'killphi/vim-ruby-refactoring', {'autoload': {'filetypes': ['ruby', 'rails']}}


  """ XML
    "
      augroup XmlVim
        autocmd FileType xml,xslt let xml_tag_completion_map = '<C-k>'
        autocmd FileType xml,xslt let g:ragtag_global_maps = 1
      augroup END

    " xml.vim + xsltassisant
      NeoBundleLazy 'xml.vim', {'autoload': {'filetypes': ['xml', 'xslt']}, 'augroup': 'XmlVim'}
      NeoBundleLazy 'xslhelper.vim', {'autoload': {'filetypes': 'xslt'}, 'build': {'unix': 'mv -f ftplugin/xsl{helper,t}.vim; git commit -am "rename ftplugin"'}}

    " ghetto HTML/XML mappings
      NeoBundleLazy 'tpope/vim-ragtag', {'autoload': {'filetypes': ['xml', 'xslt']}, 'augroup': 'XmlVim'}


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
        let g:signify_vcs_list = [ 'git', 'hg' ]
        let g:signify_diffoptions = { 'git': '-w' }


  """ VimL
    "

    " plugin for developing VimL
      NeoBundleLazy 'c9s/vim-dev-plugin', {'autoload': {'filetypes': 'vim'}}


  """ Markdown
    "
      augroup MarkdownVim
        autocmd FileType markdown map <buffer> <Leader>mp :Mm<CR>
      augroup END

    " Markdown syntax highlighting
      NeoBundleLazy 'tpope/vim-markdown', {'autoload': {'filetypes': 'markdown'}}

    " Markdown preview to quickly preview markdown files
      NeoBundleLazy 'maba/vim-markdown-preview', {'autoload': {'filetypes': 'markdown'}, 'augroup': 'MarkdownVim'}


  """ Powershell
    "

    " Windows PowerShell support
      NeoBundleLazy 'PProvost/vim-ps1', {'autoload': {'filetypes': 'ps1'}}


  """ Perl
    "

    " Support for Perl 5 and Perl 6
      NeoBundleLazy 'vim-perl/vim-perl', {'autoload': {'filetypes': 'perl'}}

      " search installed module/all modules and integrated with perldoc window
      NeoBundleLazy 'c9s/cpan.vim', {'autoload': {'filetypes': 'perl'}}

      " perl omnicompletion
      NeoBundleLazy 'c9s/perlomni.vim', {'autoload': {'filetypes': 'perl'}}


  """ EBNF
    "

    " ebnf syntax
      NeoBundleLazy 'killphi/vim-ebnf', {'autoload': {'filetypes': 'ebnf'}}



" " plugin name + desc
"   NeoBundle ''

" vim:set fdm=indent:
