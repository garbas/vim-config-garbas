"" inspired by https://github.com/MarcWeber/vim-addon-MarcWeber/blob/master/autoload/vim_addon_MarcWeber.vim

fun! vim_config_garbas#plugins(features)

"" TODO:
"" - http://peterodding.com/code/vim/easytags/
"" - http://peterodding.com/code/vim/shell
""
"" REMOVED:
""            \ 'ack',
""            \ 'SuperTab_continued.',
""            \ 'extradite', -> http://int3.github.com/vim-extradite/
""            \ 'quicksilver',
""            \ 'pep83160',
""            \ 'pyflakes2441',
""            \ 'taglist-plus',

    let plugins = {
        \ 'always': [
            \ 'snipmate',
            \ 'snipmate-snippets',
            \ 'AutoComplPop',
            \ 'Gist',
            \ 'Gundo',
            \ 'Solarized',
            \ 'Syntastic',
            \ 'TaskList',
            \ 'buffergator',
            \ 'FuzzyFinder',
            \ 'delimitMate',
            \ 'fugitive',
            \ 'unimpaired',
            \ 'scratch',
            \ 'tabular',
            \ 'markdown',
            \ 'proj',
            \ 'tagbar',
            \ ],
        \ 'python': [
            \ 'flake8',
            \ ],
        \ 'javascript': [
            \ 'javaScriptLint',
            \ 'jQuery',
            \ ],
        \ 'web': [
            \ 'css-color',
            \ 'vim-less',
            \ 'html5',
            \ ],
        \ }

    let activate = []
    for [k,v] in items(plugins)
        if k == 'always'
           \ || (type(a:features) == type([]) && index(a:features, k) >= 0)
           \ || (type(a:features) == type('') && a:features == 'all')
            call extend(activate, v)
        endif
    endfor
    call vam#ActivateAddons(activate, {
        \ 'auto_install': 1,
        \ 'plugin_root_dir': $HOME.'/.vim/addons',
        \ 'scm_merge_stategy': 'force',
        \ 'known_repos_activation_policy': 'ask',
        \ })

    call togglebg#map("<LEADER>c")
    let g:solarized_termcolors = 256
    let g:solarized_hitrail = 1
    let g:solarized_diffmode = "normal"
    colorscheme solarized

    nnoremap <LEADER>w gqip
    map <LEADER>tt <Plug>TaskList
    "map <LEADER>g :GundoToggle<CR>

    "" FUGITIVE SHORTCUTS
    map <LEADER>gg :Git
    map <LEADER>gr :Gremove
    map <LEADER>gm :Gmove
    map <LEADER>s :Gstatus<CR>
    map <LEADER>d :Gdiff<CR>
    "set statusline=%F%m%r%h%w %{fugitive#statusline()} [%{strlen(&fenc)?&fenc:&enc}] [line\ %l\/%L] 

    let g:ProjFileBrowser = 'off'

    if exists(":Tabularize")
        nmap <LEADER>a= :Tabularize /=<CR>
        vmap <LEADER>a= :Tabularize /=<CR>
        nmap <LEADER>a: :Tabularize /:\zs<CR>
        vmap <LEADER>a: :Tabularize /:\zs<CR>
    endif

    let Tlist_Use_Right_Window = 1
    " only show the current buffer, fold the rest
    let Tlist_File_Fold_Auto_Close = 1
    " show the name in the ctags list, helps with zope stuff :)
    let tlist_xml_settings = 'zcml;n:name,g:profile,p:permission,h:handler,m:component,f:factory,c:class,i:id,s:schema,t:type'
    let tlist_cfg_settings = 'ini;s:section'
    let tlist_markdown_settings = 'markdown;h:header'

    " Tagbar {{{2
    " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    nnoremap tt :TagbarToggle<CR>
    
    " ZCML type
    " XXX: This doesn't currently work because I use a filetype setting
    " of "xml.zcml".
    let g:tagbar_type_zcml = {
        \ 'ctagstype': 'zcml',
        \ 'kinds': [
            \ 'n:name',
            \ 'g:profile',
            \ 'p:permission',
            \ 'h:handler',
            \ 'm:component',
            \ 'f:factory',
            \ 'c:class',
            \ 'i:id',
            \ 's:schema'
        \ ]
    \}
    " cfg file type
    let g:tagbar_type_cfg = {
        \ 'ctagstype': 'ini',
        \ 'kinds': ['s:section']
    \ }
    " Markdown type
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'kinds': ['h:header']
    \ }

    " Fuzzy Finder {{{2
    " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    " max results, lot o' files in a buildout :)
    let g:fuzzy_ceiling=35000
    " show full paths
    let g:fuzzy_path_display = 'highlighted_path'
    " ignored files
    let g:fuzzy_ignore = "*.png;*.PNG;*.pyc;*.pyo;*.JPG;*.jpg;*.GIF;*.gif;.svn/**;.git/**;*.mo;.DS_Store;.AppleDouble"
    " available modes
    let g:FuzzyFinderOptions = {
        \'File': {'mode_available': 1},
        \'Buffer': {'mode_available': 0},
        \'Dir': {'mode_available': 0},
        \'MruFile': {'mode_available': 0},
        \'MruCmd': {'mode_available': 0},
        \'Bookmark': {'mode_available': 0},
        \}
    " Don't delete a full path when using backspace in file mode
    let g:FuzzyFinderOptions.File.smart_bs = 0
    
    " Shortcuts for opening fuzzy finder
    nmap <LEADER>f :FufFile<SPACE>**/<CR>
    nmap <LEADER>F :FufRenewCache<CR>
    "nmap <leader>t :FufCoverageFile<Space>
    "nmap <leader>ft :FufTag<Space>
    
    let g:buffergator_sort_regime = 'mru'
    let g:buffergator_viewport_split_policy = 'T'

    let g:gist_detect_filetype = 1  " detect filetype from filename
    let g:gist_open_browser_after_post = 1  " open browser after the post

    if (type(a:features) == type([]) && index(a:features, 'python') != -1)
            \ || (type(a:features) == type('') && a:features == 'all')

        au BufNewFile,BufRead *.pt set filetype=html.pt
        au BufNewFile,BufRead *.zcml set filetype=xml.zcml


        let python_highlight_all=1  "highlight all python syntax
        "highlight SpellBad term=underline gui=undercurl guisp=Red
        "let g:pyflakes_use_quickfix = 1
        "let g:pep8_map='<LEADER>8'
        "au FileType python map <buffer> <LEADER>8 :call Pep8()<CR>
    endif

    if (type(a:features) == type([]) && index(a:features, 'javascript') != -1)
            \ || (type(a:features) == type('') && a:features == 'all')
        au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    endif

endfun


fun! vim_config_garbas#config(features)

    "" GENERAL - I think we can all agree this would be nice default
    set nomodeline  " FreeBSD security advisory for this one...
    set enc=utf-8  " set the default encoding
    set title  " set the title of the window
    set titlestring=%f%(\ [%M]%)¬
    set nocompatible  " This setting prevents vim from emulating the original vi's
                      " bugs and limitations
    set showmode
    set showcmd  " Display an incomplete command in the lower right corner of the Vim window
    set history=1000  " have 1000 lines of command-line (etc) history
    set so=4  " Set a margin of lines when scrolling
    set statusline=\ \ \ \ \ line:%l\ column:%c\ \ \ %M%Y%r%=%-14.(%t%)\ %p%%
                        " set a custom status line similar to that of ``:set ruler``
    set completeopt+=longest,menuone
    set laststatus=2  " show the statusline in all window
    set equalalways  " set all window splits equal
    if has('mouse')
        set mouse=a  " have the mouse enabled all the time
        set mousemodel=popup " make a menu popup on right click
    endif
    if has('gui_running')
        
        set go-=T

        if has("gui_macvim")
            " use the whole screen
            "set fuoptions=maxvert,maxhorz
            " use Monaco with no antialiasing
            set guifont=Inconsolata-dz:h10,Inconsolata:h12,Monaco:h10
            set antialias
            " maybe set the transparency
            " XXX: getting annoyed by the transparency
            "set transparency=2
            " turn off transparency
            noremap <leader>TT :set transparency=0<CR>
        endif
    endif
    set hidden  " allow for switching buffers when a file has changes
    set t_vb=  " make sure the bell shuts up
    set pastetoggle=<F2>
    set wildmenu
    set wildmode=list:longest
    set backspace=indent,eol,start
    set autoindent
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on
    set backupdir=~/.vim/backup,.,/tmp¬
    set directory=~/.vim/backup/swap,.,/tmp¬
    set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*¬
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    ""set foldmethod=indent
    set wrap
    set textwidth=79
    if version >= 730
      set colorcolumn=80
    endif
    match ErrorMsg '\%>80v.+'
    set formatoptions=qrnl
    set number  " turn on line numbers¬
    set cul cuc " enable line & columns highlighting
    set list
    nnoremap / /\v
    vnoremap / /\v
    set incsearch  " find as you type
    set gdefault
    set hlsearch  " highlight the terms
    set ignorecase  " make searches case-insensitive
    set smartcase  " unless they contain upper-case letters
    set nospell
    set wildignore+=*.o,*.obj,*.pyc,*.pyo,.git,.svn,.hg
    set t_Co=256
    set background=dark

    "" http://ilker.de/specific-vim-settings-per-project-
    set exrc
    set secure

    "" STRIP TRAILING WHITESPACE
    fun! Preserve(command)
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        execute a:command
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfun

    nmap <LEADER>l :set list!<CR>
    nmap <LEADER>W :call Preserve("%s/\\s\\+$//e")<CR>
    map <SILENT> <LEADER>s :set spell!<CR>
    map <SILENT> <LEADER>h :set hlsearch!<CR>¬
    map <SILENT> <LEADER>n :set number!<CR>

    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete

    if (type(a:features) == type([]) && index(a:features, 'textmate') != -1)
            \ || (type(a:features) == type('') && a:features == 'all')

        " The last two lines make the tab key match bracket pairs. I use this
        " to move around all the time and <tab> is a hell of a lot easier to
        " type than %.
        nnoremap <TAB> %
        vnoremap <TAB> %


        "" - >>, << TextMate’s key mappings for manual indentation
        ""  >>              -- manual indent
        ""  <<              -- manual unindent
        nmap <D-[> <<
        nmap <D-]> >>
        vmap <D-[> <gv
        vmap <D-]> >gv

        "" Use the same symbols as TextMate for tabstops and EOLs
        set listchars=tab:▸\ ,eol:¬

        "" WINDOWS
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l

    endif

    if (type(a:features) == type([]) && index(a:features, 'expert') != -1)
            \ || (type(a:features) == type('') && a:features == 'all')

        noremap ; :
        inoremap jj <ESC>

    endif

    " Show syntax highlighting groups for word under cursor
    nmap <C-S-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc

endfun
