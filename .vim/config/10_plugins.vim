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



" good color scheme ::: http://ethanschoonover.com/solarized
  NeoBundle 'altercation/vim-colors-solarized'


"" TPope Plugins
  "

  "
  NeoBundle 'tpope/vim-sensible'

  "
  NeoBundle 'tpope/vim-git'

  "
  NeoBundle 'tpope/vim-endwise'

  "
  NeoBundle 'tpope/vim-fugitive'

  "
  NeoBundle 'tpope/vim-rake'

  "
  NeoBundle 'tpope/vim-repeat'

  " " Markdown syntax highlighting
  "   NeoBundle 'https://github.com/tpope/vim-markdown.git'

  " Unimpaired for keymaps for quicky manipulating lines and files
    NeoBundle 'https://github.com/tpope/vim-unimpaired.git'
      " Bubble single lines
      nmap <C-Up> [e
      nmap <C-Down> ]e
      " Bubble multiple lines
      vmap <C-Up> [egv
      vmap <C-Down> ]egv

  " rails.vim, nuff' said
    NeoBundleLazy 'https://github.com/tpope/vim-rails.git'
      autocmd FileType ruby NeoBundleSource vim-rails
      autocmd FileType ruby map <Leader>oc :Rcontroller<Space>
      autocmd FileType ruby map <Leader>ov :Rview<Space>
      autocmd FileType ruby map <Leader>om :Rmodel<Space>
      autocmd FileType ruby map <Leader>oh :Rhelper<Space>
      autocmd FileType ruby map <Leader>oj :Rjavascript<Space>
      autocmd FileType ruby map <Leader>os :Rstylesheet<Space>
      autocmd FileType ruby map <Leader>oi :Rintegration<Space>

  " surround for adding surround 'physics'
    NeoBundle 'https://github.com/tpope/vim-surround.git'
      " # to surround with ruby string interpolation
      " let g:surround_35 = "#{\r}"
      " " - to surround with no-output erb tag
      " let g:surround_45 = "<% \r %>"
      " " = to surround with output erb tag
      " let g:surround_61 = "<%= \r %>"

  " vim-ragtag
    NeoBundleLazy 'tpope/vim-ragtag'
      autocmd FileType xml,xslt NeoBundleSource vim-ragtag
      autocmd FileType xml,xslt let g:ragtag_global_maps = 1


"" Shougo Plugins
  "

  "
  NeoBundle 'Shougo/unite.vim'

  "
  NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


"" sjl plugins
  "

  " gundo for awesome undo tree visualization
    NeoBundle 'https://github.com/sjl/gundo.vim.git'
      map <Leader>h :GundoToggle<CR>

  " use VIm as a 3-way-merge tool
    NeoBundle 'sjl/splice.vim'


"
  " NeoBundle 'harleypig/vcscommand.vim'


"
  " NeoBundle 'killphi/vim-javascript'


" TODO: find out what it does
  NeoBundle 'vim-scripts/L9'


"
  NeoBundleLazy 'vim-ruby/vim-ruby'
    autocmd FileType ruby NeoBundleSource vim-ruby


"
  NeoBundle 'tomtom/tcomment_vim'


"
  " NeoBundle 'michaeljsmith/vim-indent-object'


"
  NeoBundle 'tsaleh/vim-matchit'


"
  NeoBundle 'kana/vim-textobj-user'


"
  NeoBundleLazy 'nelstrom/vim-textobj-rubyblock'
    autocmd FileType ruby NeoBundleSource vim-textobj-rubyblock


"
  NeoBundle 'skammer/vim-css-color'
    autocmd FileType javascript,html,css NeoBundleSource vim-css-color


" Coffee script
  NeoBundleLazy 'https://github.com/kchmck/vim-coffee-script.git'
    autocmd FileType coffee NeoBundleSource vim-coffee-script



" AG aka The Silver Searcher
  NeoBundle 'https://github.com/rking/ag.vim.git'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>


" " Tagbar for navigation by tags using CTags
"   NeoBundle 'https://github.com/majutsushi/tagbar.git'
"     let g:tagbar_autofocus = 1
"     map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
"     map <Leader>. :TagbarToggle<CR>


" Markdown preview to quickly preview markdown files
  NeoBundleLazy 'https://github.com/maba/vim-markdown-preview.git'
    autocmd FileType markdown NeoBundleSource vim-markdown-preview
    autocmd FileType markdown map <buffer> <Leader>mp :Mm<CR>


" NERDTree for project drawer
  NeoBundle 'https://github.com/scrooloose/nerdtree.git'
    let NERDTreeHijackNetrw = 0
    nmap gt :NERDTreeToggle<CR>
    nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>


" Tabular for aligning text
  NeoBundle 'https://github.com/godlygeek/tabular.git'
    map <Leader>a :Tabularize<space>


" Syntastic for catching syntax errors on save
  NeoBundle 'https://github.com/scrooloose/syntastic.git'
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_warnings=1
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass'] }


" tmux config
  NeoBundleLazy 'tsaleh/vim-tmux'
    autocmd FileType tmux NeoBundleSource vim-tmux


" fix HTML <a> underlines of leading/trailing whitespace
  NeoBundleLazy 'html_annoyance'
    autocmd FileType html NeoBundleSource html_annoyance


" " IndentAnything -- dependency for Javscript-Indentation
"   NeoBundle 'IndentAnything'


" " better JS indent
"   NeoBundle 'Javascript-Indentation'


" " indent motion for navigation
"   NeoBundle 'indent-motion'


" " HTML 5 syntax  -- not yet ready
"   NeoBundle 'othree/html5.vim'


" " tlib for TomTom's stuff
"   NeoBundle 'tomtom/tlib_vim'


" " code snippet skeletons
"   NeoBundle 'tomtom/tskeleton_vim'
"     let g:tskelMapGoToNextTag = '<Leader>j'


" " code snippet skeletons -> place-holders
"   NeoBundle 'tomtom/stakeholders_vim'


" auto close brackets 'n stuff
  NeoBundle 'MartinLafreniere/vim-PairTools'


" detect indendation of files
  NeoBundle 'ciaranm/detectindent'
    let g:detectindent_preferred_expandtab = 1
    let g:detectindent_preferred_indent = 2
    autocmd VimEnter * :DetectIndent


" indentLines - mark indendation
  NeoBundle 'Yggdroot/indentLine'


" vim-kompleter - super completion
  NeoBundle 'szw/vim-kompleter'

" xml.vim + xsltassisant
  NeoBundleLazy 'xml.vim'
  NeoBundleLazy 'xslhelper.vim'
    autocmd FileType xml,xslt NeoBundleSource xml.vim
    autocmd FileType xslt NeoBundleSource xslhelper.vim
    autocmd FileType xml,xslt let xml_tag_completion_map = '<C-k>'



" " Ruby MatchIt Fork
"   NeoBundle 'killphi/ruby-matchit'


" nginx.conf
  NeoBundle 'chase/nginx.vim'
    " autocmd FileType xml,xslt NeoBundleSource nginx.vim


" better than GitGutter
  NeoBundle 'mhinz/vim-signify'
    let g:signify_vcs_list = [ 'git', 'hg' ]
    let g:signify_diffoptions = { 'git': '-w' }


"
  NeoBundle 'juvenn/mustache.vim'
    autocmd FileType mustache NeoBundleSource mustache.vim


" " plugin name + desc
"   NeoBundle ''

" vim:set fdm=indent:
