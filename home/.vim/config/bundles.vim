""" EXAMPLES  {{{
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
"
"}}}



""" Colors
  "{{{

  " Solarized color scheme -- http://ethanschoonover.com/solarized
    NeoBundle 'altercation/vim-colors-solarized'

  "}}}


""" extend functionality
  "{{{

  """ Shougo niceness
    "{{{

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

    " file explorer  {{{
      NeoBundle 'Shougo/vimfiler.vim'

      let g:vimfiler_as_default_explorer = 1
      "}}}

    "}}}

  """ tpope Awesomeness
    "{{{

    " Defaults everyone can agree on (according to TPope)
      NeoBundle 'tpope/vim-sensible'

    " tmux basics
      NeoBundle 'tpope/vim-tbone'

    " enable repeating supported plugin maps with '.'
      NeoBundle 'tpope/vim-repeat'

    " wisely add 'end' in ruby, endfunction/endif/more in vim script
      NeoBundle 'tpope/vim-endwise'

    " Unimpaired for keymaps for quicky manipulating lines and files  {{{
      NeoBundle 'tpope/vim-unimpaired'

      " Bubble single lines
      nmap <C-Up> [e
      nmap <C-Down> ]e
      " Bubble multiple lines
      vmap <C-Up> [egv
      vmap <C-Down> ]egv
      "}}}

    " quoting/parenthesizing made simple  {{{
      NeoBundle 'tpope/vim-surround'

      " # to surround with ruby string interpolation
      let g:surround_35 = "#{\r}"
      " " - to surround with no-output erb tag
      " let g:surround_45 = '<% \r %>'
      " " = to surround with output erb tag
      " let g:surround_61 = '<%= \r %>'
      "}}}

    " helpers for UNIX
      NeoBundle 'tpope/vim-eunuch'

    " Git runtime files
      NeoBundle 'tpope/vim-git'

    " a Git wrapper so awesome, it should be illegal
      NeoBundle 'tpope/vim-fugitive'

    " zeroconf for file indents
      NeoBundle 'tpope/vim-sleuth'

    " easily search for, substitute, and abbreviate multiple variants of a word
      NeoBundle 'tpope/vim-abolish'

    " asynchronous build and test dispatcher
      NeoBundle 'tpope/vim-dispatch'

    "}}}

  """ killphi stuff
    "{{{

    " highlight current block scope
      NeoBundle 'killphi/vim-floodlight'

    "}}}

  """ vim-scripts
    "{{{

    " emmet.io - formerly known as ZenCode
      NeoBundle 'Emmet.vim'

    " create cscope database and connect to existing proper database automatically  {{{
      NeoBundle 'cscope.vim'

      set nocscopetag
      "}}}

    " Automated tag file generation and syntax highlighting of tags  {{{
      NeoBundle 'easytags.vim', {
            \   'depends': 'vim-misc',
            \   'augroup': 'VimScriptsEasyTags'
            \ }

      let g:easytags_file = '~/.vim/vimtags'
      let g:easytags_dynamic_files = 2
      let g:easytags_by_filetype = '~/.vim/easytags'
      let g:easytags_resolvelinks = 1
      let g:easytags_auto_highlight = 0

      execute "set tags+=" . resolve(expand('~/.vim/vimtags'))

      function! s:easytags_fix_buffer_tags()
        if exists('b:git_dir')
          execute 'setl tags^="' . resolve(expand(b:git_dir).'/../tags') . '"'
        endif
      endfunction

      augroup VimScriptsEasyTags
        autocmd!
        autocmd BufEnter * call s:easytags_fix_buffer_tags()
      augroup END
      "}}}

    " Syntastic for catching syntax errors on save  {{{
      NeoBundle 'Syntastic'

      let g:syntastic_enable_signs=1
      let g:syntastic_quiet_messages = {'level': 'warnings'}
      " syntastic is too slow for haml and sass
      let g:syntastic_mode_map = {
            \   'mode': 'active',
            \   'active_filetypes': [],
            \   'passive_filetypes': [ 'haml','scss','sass' ]
            \ }
      " ruby checking includes rubocop
      let g:syntastic_ruby_checkers = ['mri', 'rubocop']
      "}}}

    " comment stuff out
      NeoBundle 'tComment'

    " cascading indent
      NeoBundle 'cascading.vim'

    " saves files into non-existing directories
      NeoBundle 'auto_mkdir'

    "}}}

  """ user defined text objects (kana/vim-textobj-user)
    "{{{

    " Text objects for indented blocks of lines
      NeoBundle 'kana/vim-textobj-indent', {'depends': 'kana/vim-textobj-user'}

    " Text objects for comments
      NeoBundle 'glts/vim-textobj-comment', {'depends': 'kana/vim-textobj-user'}

    " A text object to turn foo_bar_baz into foo_baz *and* quuxSpamEggs into quuxEggs *and* shine your shoes
      NeoBundle 'Julian/vim-textobj-variable-segment', {
            \   'depends': 'kana/vim-textobj-user'
            \ }

    " custom text object for selecting ruby stuff
      NeoBundleLazy 'tek/vim-textobj-ruby', {
            \   'depends': 'kana/vim-textobj-user',
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

    " TextObj SignifyHunk
      NeoBundle 'killphi/vim-textobj-signify-hunk', {
            \   'depends': [ 'kana/vim-textobj-user', 'mhinz/vim-signify' ]
            \ }

    "}}}

  " Taste the rainbow!  {{{
    NeoBundle 'kien/rainbow_parentheses.vim'

    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
    "}}}

  " undo tree visualization  {{{
    NeoBundle 'sjl/gundo.vim'

    map <Leader>h :GundoToggle<CR>
    "}}}

  " Perl/Ruby style regexp notation  {{{
    NeoBundle 'othree/eregex.vim'

    let g:eregex_default_enable = 0
    nnoremap <leader>/ :call eregex#toggle()<CR>
    "}}}

  " Toggles between relative and absolute line numbers  {{{
    NeoBundle 'jeetsukumaran/vim-numbertoggle'

    let g:numbertoggle_start_in_relative_mode = 0
    "}}}

  " Collaborative Editing for Vim  {{{
    NeoBundle 'FredKSchott/CoVim', {
          \   'build': {
          \     'unix': 'if [[ -z `which pip 2>/dev/null` ]]; then ' +
          \               'echo you need to install python pip!; ' +
          \             'else ' +
          \               'pip install twisted argparse; ' +
          \             'fi'
          \   }
          \ }

    let CoVim_default_name = "killphi"
    let CoVim_default_port = "9999"
    "}}}

  " http://editorconfig.org/
    NeoBundle 'editorconfig/editorconfig-vim'

  " Tagbar for navigation by tags using CTags  {{{
    NeoBundle 'majutsushi/tagbar'

    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 1
    let g:tagbar_singleclick = 1
    let g:tagbar_autoshowtag = 1

    map <Leader>. :TagbarToggle<CR>
    "}}}

  " display indent levels visually in code  {{{
    NeoBundle 'nathanaelkane/vim-indent-guides', {
          \   'augroup': 'NathanaelKaneIndentGuides'
          \ }

    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 3
    let g:indent_guides_auto_colors = 0

    augroup NathanaelKaneIndentGuides
      autocmd!
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
    augroup END
    "}}}

  " use VIm as a 3-way-merge tool
    NeoBundle 'sjl/splice.vim'

  " lean & mean statusline for vim that's light as air  {{{
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
    "}}}

  " AG aka The Silver Searcher  {{{
    NeoBundle 'rking/ag.vim'

    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>
    "}}}

  " Tabular for aligning text  {{{
    NeoBundle 'godlygeek/tabular'

    map <Leader>a :Tabularize<space>
    "}}}

  " auto close brackets 'n stuff
    NeoBundle 'MartinLafreniere/vim-PairTools'

  " :substitute preview  {{{
    NeoBundle 'osyo-manga/vim-over'

    nnoremap <silent> <Leader>:s :OverCommandLine<CR>s/
    nnoremap <silent> <Leader>:% :OverCommandLine<CR>%s/
    vnoremap <silent> <Leader>:s :OverCommandLine<CR>s/
    "}}}

  " Goyo - distraction free mode  {{{
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
    "}}}

  " Limelight - Goyo enhancement  {{{
    NeoBundleLazy 'junegunn/limelight.vim', {
          \   'autoload': {'commands': 'Goyo'},
          \   'augroup': 'JuneGunnLimelight'
          \ }

    augroup JuneGunnLimelight
      autocmd User GoyoEnter Limelight
      autocmd User GoyoLeave Limelight!
    augroup END
    "}}}

  " Better whitespace highlighting for Vim  {{{
    NeoBundle 'ntpeters/vim-better-whitespace', {
          \   'augroup': 'NtPetersBetterWhitespace'
          \ }

    let g:strip_no_action_list = ['markdown']
    map <Leader>c :StripWhitespace<cr>

    function! s:ConditionalStripWhitespace()
      let i = index(g:strip_no_action_list, &ft)

      if i < 0
        StripWhitespace
      endif
    endfunction

    augroup NtPetersBetterWhitespace
      autocmd!
      autocmd BufWritePre <buffer> call s:ConditionalStripWhitespace()
    augroup END
    "}}}

    " Signify  {{{
      NeoBundle 'mhinz/vim-signify'

      let g:signify_sign_overwrite = 1
      let g:signify_vcs_list = [ 'git' ]
      let g:signify_diffoptions = { 'git': '-b' }
      "}}}

    " default snippets
      NeoBundle 'honza/vim-snippets'

    " gitk for Vim
      NeoBundle 'gregsexton/gitv', {
            \   'depends': 'tpope/vim-fugitive'
            \ }

  "}}}


""" Language files (lazy loaded)
  "{{{

  """ HTML
    "{{{

    " HTML 5 syntax & omnicomplete
      NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': 'html'}}

    " fix HTML <a> underlines of leading/trailing whitespace
      NeoBundleLazy 'html_annoyance', {'autoload': {'filetypes': 'html'}}

    "}}}


  """ JavaScript
    "{{{

    " Better JS handling
      NeoBundleLazy 'pangloss/vim-javascript', {
            \   'autoload': {'filetypes': 'javascript'}
            \ }

    " Coffee script
      NeoBundleLazy 'kchmck/vim-coffee-script', {
            \   'autoload': {'filetypes': 'coffee'}
            \ }

    " JS Beautify  {{{
      NeoBundleLazy 'maksimr/vim-jsbeautify', {
            \   'autoload': {'filetypes': [ 'javascript', 'html', 'css' ]},
            \   'augroup': 'MaksimRJSBeautify'
            \ }

      augroup MaksimRJSBeautify
        autocmd!
        autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
        " for html
        autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
        " for css or scss
        autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
      augroup END
      "}}}

    "}}}


  """ Template Languages
    "{{{

    " Mustache & Handlebars
      NeoBundleLazy 'mustache/vim-mustache-handlebars', {
            \   'autoload': {
            \     'filetypes': [ 'html.mustache', 'html.handlebars' ]
            \   }
            \ }

    "}}}


  """ Config files
    "{{{

    " nginx.conf syntax
      NeoBundleLazy 'chase/nginx.vim', {'autoload': {'filetypes': 'nginx'}}

    " tmux.conf syntax
      NeoBundleLazy 'tsaleh/vim-tmux', {'autoload': {'filetypes': 'tmux'}}

    " Dockerfile syntax + snippets
      NeoBundleLazy 'ekalinin/Dockerfile.vim', {
            \   'autoload': {'filetypes': 'Dockerfile'}
            \ }

    "}}}


  """ Ruby
    "{{{

    " Switch Ruby versions from inside Vim
      NeoBundleLazy 'tpope/vim-rvm', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

    " Lightweight support for Ruby's Bundler'
      NeoBundleLazy 'tpope/vim-bundler', {
            \   'autoload': {
            \     'filetypes': [ 'ruby', 'eruby' ],
            \     'commands': 'Bundle'
            \   }
            \ }

    " like rails.vim without the rails
      NeoBundleLazy 'tpope/vim-rake', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

    " rails.vim  {{{
      NeoBundleLazy 'tpope/vim-rails', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]},
            \   'augroup': 'TPopeVimRails'
            \ }

      augroup TPopeVimRails
        autocmd!
        autocmd FileType ruby map <Leader>oc :Rcontroller<Space>
        autocmd FileType ruby map <Leader>ov :Rview<Space>
        autocmd FileType ruby map <Leader>om :Rmodel<Space>
        autocmd FileType ruby map <Leader>oh :Rhelper<Space>
        autocmd FileType ruby map <Leader>oj :Rjavascript<Space>
        autocmd FileType ruby map <Leader>os :Rstylesheet<Space>
        autocmd FileType ruby map <Leader>oi :Rintegration<Space>
      augroup END
      ""}}}

    " Refactoring
      NeoBundleLazy 'killphi/vim-ruby-refactoring', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

    " Testing
      NeoBundleLazy 'jgdavey/vim-turbux', {
            \   'depends': 'tpope/vim-dispatch',
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

    "}}}


  """ Markdown
    "{{{

    " Markdown syntax highlighting
      NeoBundleLazy 'tpope/vim-markdown', {'autoload': {'filetypes': 'markdown'}}

    " Markdown preview to quickly preview markdown files  {{{
      NeoBundleLazy 'maba/vim-markdown-preview', {
            \   'autoload': {'filetypes': 'markdown'},
            \   'augroup': 'MabaMarkdownVim'
            \ }

      augroup MabaMarkdownVim
        autocmd!
        autocmd FileType markdown map <buffer> <Leader>mp :Mm<CR>
      augroup END
      "}}}

    "}}}


  """ EBNF
    "{{{

    " ebnf syntax
      NeoBundleLazy 'killphi/vim-ebnf', {'autoload': {'filetypes': 'ebnf'}}

    "}}}


  """ Elixir
    "{{{

    " VIm support
      NeoBundleLazy 'elixir-lang/vim-elixir', {
            \   'autoload': {'filetypes': 'elixir'}
            \ }

    " snippets
      NeoBundleLazy 'carlosgaldino/elixir-snippets', {
            \   'autoload': {'filetypes': 'elixir'}
            \ }

    "}}}


  """ fish - Friendly Interactive SHell
    "{{{

    " fish syntax files
      NeoBundle 'dag/vim-fish'

    "}}}

  """ XML / XSLT
    "{{{

    " extend pairtools for xml/xslt
      NeoBundleLazy 'killphi/vim-PairTools-xml-xslt-extension', {
            \   'depends': 'MartinLafreniere/vim-PairTools',
            \   'autoload': {'filetypes': [ 'xml', 'xslt' ]}
            \ }

    "}}}

  """ Rust
    "{{{

    " Rust Syntax
      NeoBundleLazy 'wting/rust.vim', {
            \   'autoload': {'filetypes': 'rust'}
            \ }

    "}}}
  "}}}



" " plugin name + desc
"   NeoBundle ''

" vim:set fdm=marker:
