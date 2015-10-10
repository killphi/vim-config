""" Colors
  "{{{

  " Solarized color scheme -- http://ethanschoonover.com/solarized  {{{
    NeoBundle 'altercation/vim-colors-solarized'

    let g:solarized_menu = 0
    "}}}

  "}}}


""" extend functionality
  "{{{

  """ Shougo niceness
    "{{{

    " unite and create user interfaces
      NeoBundle 'Shougo/unite.vim'

    " interactive command execution
      NeoBundle 'Shougo/vimproc', {
            \   'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \   }
            \ }

    " file explorer  {{{
      NeoBundle 'Shougo/vimfiler.vim', {
            \   'augroup': 'vimfiler'
            \ }

      let g:vimfiler_as_default_explorer = 1

      let g:vimfiler_tree_leaf_icon = ' '
      let g:vimfiler_tree_opened_icon = '▾'
      let g:vimfiler_tree_closed_icon = '▸'
      let g:vimfiler_file_icon = '-'
      let g:vimfiler_marked_file_icon = '*'
      "}}}

    "}}}

  """ tpope Awesomeness
    "{{{

    " defaults everyone can agree on (according to TPope)
      NeoBundle 'tpope/vim-sensible'

    " tmux basics
      NeoBundle 'tpope/vim-tbone', {
            \   'augroup': 'tbone_reign_supreme_over_tmux_command'
            \ }

    " enable repeating supported plugin maps with '.'
      NeoBundle 'tpope/vim-repeat'

    " wisely close statements in supported languages
      NeoBundle 'tpope/vim-endwise'

    " keymaps for quicky manipulating lines and files
      NeoBundle 'tpope/vim-unimpaired'

    " quoting/parenthesizing made simple  {{{
      NeoBundle 'tpope/vim-surround'

      " # to surround with ruby string interpolation
      let g:surround_35 = "#{\r}"
      "}}}

    " helpers for UNIX
      NeoBundle 'tpope/vim-eunuch'

    " git runtime files
      NeoBundle 'tpope/vim-git'

    " a Git wrapper so awesome, it should be illegal
      NeoBundle 'tpope/vim-fugitive', {
            \   'augroup': 'fugitive'
            \ }

    " zeroconf for file indents
      NeoBundle 'tpope/vim-sleuth'

    " " easily search for, substitute, and abbreviate multiple variants of a word
    "   NeoBundle 'tpope/vim-abolish'

    "}}}

  """ killphi stuff
    "{{{

    " " highlight current block scope
    "   NeoBundle 'killphi/vim-floodlight', {
    "         \   'rev': 'dev'
    "         \ }

    " coverage: vim-legend - use with gem 'cadre'  {{{
      NeoBundleLazy 'killphi/vim-legend', {
            \   'rev': 'basic_refactorings',
            \   'autoload': {'filetypes': [ 'ruby', 'rust' ]},
            \   'augroup': 'Legend'
            \ }

      let g:legend_active_auto = 0

      let g:legend_hit_sign="✔"
      let g:legend_miss_sign="✘"
      let g:legend_ignored_sign="◌"

      " Solarized dark
      let g:legend_hit_color="ctermfg=2"
      let g:legend_miss_color="ctermfg=9"
      let g:legend_ignored_color="ctermfg=7"

      " highlight miss lines
      let g:legend_miss_line_color="ctermbg=0"
      "}}}

    "}}}

  """ vim-scripts
    "{{{

    " better % matching
      NeoBundle 'matchit.zip'

    " emmet.io - formerly known as ZenCode
      NeoBundle 'Emmet.vim'

    " create cscope database and connect to existing proper database automatically  {{{
      NeoBundle 'cscope.vim'

      set nocscopetag
      "}}}

    " automated tag file generation and syntax highlighting of tags  {{{
      NeoBundle 'easytags.vim', {
            \   'augroup': 'PluginEasyTags',
            \   'depends': 'vim-misc'
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

      augroup BundleVimScriptsEasyTags
        autocmd!
        autocmd BufEnter * call s:easytags_fix_buffer_tags()
      augroup END
      "}}}

    " catching syntax errors on save  {{{
      NeoBundle 'Syntastic'

      let g:syntastic_enable_signs = 1
      let g:syntastic_check_on_open = 1

      " syntastic is too slow for haml and sass
      let g:syntastic_mode_map = {
            \   'mode': 'active',
            \   'active_filetypes': ['ruby', 'javascript'],
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

    " text objects for indented blocks of lines
      NeoBundle 'kana/vim-textobj-indent', {'depends': 'kana/vim-textobj-user'}

    " text objects for comments
      NeoBundle 'glts/vim-textobj-comment', {'depends': 'kana/vim-textobj-user'}

    " text object to turn foo_bar_baz into foo_baz *and* quuxSpamEggs into quuxEggs *and* shine your shoes
      NeoBundle 'Julian/vim-textobj-variable-segment', {
            \   'depends': 'kana/vim-textobj-user'
            \ }

    " custom text object for selecting ruby stuff
      NeoBundleLazy 'tek/vim-textobj-ruby', {
            \   'depends': 'kana/vim-textobj-user',
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

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

  " toggles between relative and absolute line numbers  {{{
    NeoBundle 'killphi/vim-numbertoggle', {
          \   'rev': 'add_start_in_relative_mode_setting'
          \ }

    let g:numbertoggle_start_in_relative_mode = 0
    let g:NumberToggleTrigger = "<F2>"
    "}}}

  " collaborative editing for Vim  {{{
    NeoBundle 'FredKSchott/CoVim', {
          \   'build': {
          \     'unix': 'pip install twisted argparse --exists-action i --user'
          \   }
          \ }

    let CoVim_default_name = "killphi"
    let CoVim_default_port = "9999"
    "}}}

  " http://editorconfig.org/
    NeoBundle 'editorconfig/editorconfig-vim', {
          \   'depends': 'PreserveNoEOL'
          \ }

  " tagbar for navigation by tags using CTags  {{{
    NeoBundle 'majutsushi/tagbar', {
          \   'augroup': 'TagbarAutoCmds'
          \ }

    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 1
    let g:tagbar_singleclick = 1
    let g:tagbar_autoshowtag = 1

    map <Leader>. :TagbarToggle<CR>
    "}}}

  " display indent levels visually in code  {{{
    NeoBundle 'Yggdroot/indentLine'

    let g:indentLine_color_term = 0
    let g:indentLine_char = '¦'
    let g:indentLine_indentLevel = 20
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_enabled = 0
    let g:indentLine_loaded = 0
    "}}}

  " use VIm as a 3-way-merge tool  {{{
    NeoBundle 'sjl/splice.vim'

    let g:splice_initial_diff_grid = 1
    let g:splice_initial_scrollbind_grid = 1
    let g:splice_prefix = "<Leader>s"
    "}}}

  " lean & mean statusline for vim that's light as air  {{{
    NeoBundle 'bling/vim-airline', {
          \   'augroup': 'airline',
          \   'depends': 'bling/vim-bufferline'
          \ }

    " enable powerline font symbols
    let g:airline_powerline_fonts = 1

    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#hunks#enabled = 1

    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#tagbar#flags = 'f'
    "}}}

  " ag aka The Silver Searcher  {{{
    NeoBundle 'rking/ag.vim'

    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>
    "}}}

  " aligning text  {{{
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

  " distraction free mode  {{{
    NeoBundle 'junegunn/goyo.vim'

    function! s:goyo_before()
      silent !tmux set status off
      set wrap
    endfunction

    function! s:goyo_after()
      silent !tmux set status on
      set nowrap
    endfunction

    let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
    map <silent> <leader>G :Goyo<CR>
    "}}}

  " Goyo enhancement  {{{
    NeoBundleLazy 'junegunn/limelight.vim', {
          \   'autoload': {'commands': [ 'Goyo', 'Limelight' ]}
          \ }

    " like comments
    let g:limelight_conceal_ctermfg = 10
    " invisible
    " let g:limelight_conceal_ctermfg = 8
    " almost invisible
    " let g:limelight_conceal_ctermfg = 0

    augroup BundleJuneGunnLimelight
      autocmd!
      autocmd User GoyoEnter Limelight
      autocmd User GoyoLeave Limelight!
    augroup END
    "}}}

    " git chunk signs  {{{
      NeoBundle 'mhinz/vim-signify', {
            \   'augroup': 'signify'
            \ }

      let g:signify_disable_by_default = 1
      let g:signify_vcs_list = [ 'git' ]
      let g:signify_diffoptions = { 'git': '-b' }
      let g:signify_mapping_inner_motion = 'ih'
      let g:signify_mapping_outer_motion = 'ah'

      map <silent> <leader>st :SignifyToggle<CR>
      "}}}

    " default snippets
      NeoBundle 'honza/vim-snippets'

    " gitk for Vim
      NeoBundle 'gregsexton/gitv', {
            \   'depends': 'tpope/vim-fugitive'
            \ }

    " multiple selection editing
      NeoBundle 'terryma/vim-multiple-cursors'

  "}}}


""" language files (lazy loaded)
  "{{{

  """ HTML
    "{{{

    " HTML 5 syntax & omnicomplete
      NeoBundleLazy 'othree/html5.vim', {
            \   'autoload': {
            \     'filetypes': [ 'html', 'html.mustache', 'html.handlebars' ]
            \   }
            \ }

    " fix HTML <a> underlines of leading/trailing whitespace
      NeoBundleLazy 'html_annoyance', {
            \   'autoload': {
            \     'filetypes': [ 'html', 'html.mustache', 'html.handlebars' ]
            \   }
            \ }

    "}}}


  """ JavaScript
    "{{{

    " Better JS handling
      NeoBundleLazy 'pangloss/vim-javascript', {
            \   'autoload': {'filetypes': 'javascript'}
            \ }

    " " Coffee script
    "   NeoBundleLazy 'kchmck/vim-coffee-script', {
    "         \   'autoload': {'filetypes': 'coffee'}
    "         \ }

    " JS Beautify  {{{
      NeoBundleLazy 'maksimr/vim-jsbeautify', {
            \   'autoload': {'filetypes': [ 'javascript', 'html', 'css' ]}
            \ }

      augroup BundleMaksimRJSBeautify
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

      let g:mustache_abbreviations = 1
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

    " switch Ruby versions from inside Vim
      NeoBundleLazy 'tpope/vim-rvm', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]}
            \ }

    " lightweight support for Ruby's Bundler'
      NeoBundleLazy 'tpope/vim-bundler', {
            \   'autoload': {
            \     'filetypes': [ 'ruby', 'eruby' ],
            \     'commands': 'Bundle'
            \   }
            \ }

    " like rails.vim without the rails
      NeoBundleLazy 'tpope/vim-rake', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]},
            \   'augroup': 'rake'
            \ }

    " rails.vim  {{{
      NeoBundleLazy 'tpope/vim-rails', {
            \   'autoload': {'filetypes': [ 'ruby', 'eruby' ]},
            \   'augroup': 'railsPluginDetect'
            \ }

      augroup BundleTPopeVimRails
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

    " refactoring
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

    " syntax highlighting
      NeoBundleLazy 'tpope/vim-markdown', {'autoload': {'filetypes': 'markdown'}}

    " quickly preview markdown files  {{{
      NeoBundleLazy 'maba/vim-markdown-preview', {
            \   'autoload': {'filetypes': 'markdown'}
            \ }

      augroup BundleMabaMarkdownVim
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

    " basic support
      NeoBundleLazy 'elixir-lang/vim-elixir', {
            \   'autoload': {'filetypes': 'elixir'}
            \ }

    " snippets
      NeoBundleLazy 'carlosgaldino/elixir-snippets', {
            \   'autoload': {'filetypes': 'elixir'}
            \ }

    "}}}


  """ FISH - Friendly Interactive SHell
    "{{{

    " FISH syntax files
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

    " basic support
      NeoBundleLazy 'rust-lang/rust.vim', {
            \   'autoload': {'filetypes': 'rust'}
            \ }

    "}}}


  """ TOML
    "{{{

    " basic support
      NeoBundleLazy 'cespare/vim-toml', {
            \   'autoload': {'filetypes': 'toml'}
            \ }

    "}}}


  " """ Julia
    "{{{

    " basic support  {{{
      NeoBundleLazy 'killphi/julia-vim', {
            \   'autoload': {'filetypes': 'julia'},
            \   'rev': 'l2u_only_on_julia'
            \ }
      "}}}

    "}}}

  "}}}


" " plugin name + desc
"   NeoBundle ''

" vim:set fdm=marker:
