"" inspired by https://github.com/MarcWeber/vim-addon-MarcWeber/blob/master/autoload/vim_addon_MarcWeber.vim

fun! vim_config_garbas#plugins(features)

    let plugins = {
        \ 'always': [
            \ 'vim-addon-git',
            \ 'snipmate',
            \ 'snipmate-snippets',
            \ 'Gist',
            \ 'Gundo',
            \ 'TaskList',
            \ 'ack',
            \ 'SuperTab_continued.',
            \ 'wombat256',
            \ 'quicksilver',
            \ ],
        \ 'vim': [
            \ 'reload',
            \ 'vim-dev-plugin',
            \ ],
        \ 'python': [
            \ 'pep83160',
            \ 'pyflakes2441',
            \ ],
        \ 'javascript': [
            \ 'javaScriptLint',
            \ 'jQuery',
            \ ],
        \ 'nix' : [
            \ 'vim-addon-nix',
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
        \ 'scm_merge_stategy': 'force',
        \ 'known_repos_activation_policy': 'ask',
        \ })

    colorscheme wombat256mod
    nnoremap <LEADER>w gqip

    map <LEADER>a :Ack<SPACE>
    map <LEADER>tt <Plug>TaskList
    map <LEADER>g :GundoToggle<CR>

    let g:gist_detect_filetype = 1  " detect filetype from filename
    let g:gist_open_browser_after_post = 1  " open browser after the post

    if (type(a:features) == type([]) && index(a:features, 'python') != -1)
            \ || (type(a:features) == type('') && a:features == 'all')
        let g:pep8_map='<LEADER>8'

        let python_highlight_all=1  "highlight all python syntax
        highlight SpellBad term=underline gui=undercurl guisp=Red
        let g:pyflakes_use_quickfix = 0
        au FileType python map <buffer> <LEADER>8 :call Pep8()<CR>
    endif

    if (type(a:features) == type([]) && index(a:features, 'javascript') != -1)
            \ || (type(a:features) == type('') && a:features == 'all')
        au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    endif

endfun


fun! vim_config_garbas#config(features)

    "" GENERAL - I think we can all agree this would be nice default
    let mapleader = ","
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
    set foldmethod=indent
    set wrap
    set textwidth=79
    if version >= 730
      set colorcolumn=80
    endif
    match ErrorMsg '\%>80v.+'
    set formatoptions=qrnl
    set number  " turn on line numbers¬
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
    map <LEADER>a :Ack<SPACE>
    map <SILENT> <LEADER>n :set number!<CR>


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

        "" WINDOWS / BUFFERS
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

endfun
