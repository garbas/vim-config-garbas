" .vimrc
" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/garbas/vim-config-garbas
"

fun! vim_config_garbas#config(category)

" Addons (VIM) ------------------------------------------------------------ {{{

" TODO:
" cscope

" addons to rethink 
"    \ ['tslime', ['default']],
"    \ ['delimitMate', ['default']],
"    \ ['Markdown', ['default']], " requires old snipMate
let addons = [
    \ ['AutoComplPop', ['default']],
        \ ['L9', ['default']],
    \ ['unimpaired', ['default']],
    \ ['Scratch', ['default']],
    \ ['Tabular', ['default']],
    \ ['molokai', ['default']],
    \ ['Wombat', ['default']],
    \ ['flake8', ['default', 'python']],
    \ ['python%790', ['default', 'python']],
    \ ['jQuery', ['default', 'web']],
    \ ['css_color@skammer', ['default', 'web']],
    \ ['vim-less', ['default', 'web']],
    \ ['html5', ['default', 'web']],
    \ ['YankRing', ['default']],
    \ ['sparkup', ['default']],
    \ ]

" ADDONS:
" snipMate {{{
function! Addons_snipmate()
    "let g:snips_trigger_key='<C-e>'
endfunction

function! Addons_snipmate_snippets()
endfunction

call extend(addons, [['snipmate', ['default'], 'Addons_snipmate']])
call extend(addons, [['snipmate-snippets', ['default'], 'Addons_snipmate_snippets']])

" }}}
" Python-mode {{{

function! Addons_Python_mode_klen ()
    let g:pymode_doc = 0
    let g:pymode_run = 0
    let g:pymode_lint = 0
    let g:pymode_breakpoint = 0
    let g:pymode_syntax = 1
    let g:pymode_utils_whitespaces = 0
    let g:pymode_virtualenv = 0
    let g:pymode_options_indent = 0
    let g:pymode_options_fold = 0
    let g:pymode_options_other = 0

    let g:pymode_rope = 1
    let g:pymode_rope_global_prefix = "<localleader>R"
    let g:pymode_rope_local_prefix = "<localleader>r"
    "let g:pymode_rope_auto_project = 1
    "let g:pymode_rope_enable_autoimport = 0
    "let g:pymode_rope_autoimport_generate = 1
    "let g:pymode_rope_autoimport_underlineds = 0
    "let g:pymode_rope_codeassist_maxfixes = 10
    "let g:pymode_rope_sorted_completions = 1
    "let g:pymode_rope_extended_complete = 1
    "let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
    "let g:pymode_rope_confirm_saving = 1
    "let g:pymode_rope_vim_completion = 1
    "let g:pymode_rope_guess_project = 1
    "let g:pymode_rope_goto_def_newwin = 0
    "let g:pymode_rope_always_show_complete_menu = 0
endfunction

call extend(addons, [['Python-mode-klen', ['default', 'python'], 'Addons_Python_mode_klen']])

" }}}
" Syntastic {{{
" I should think about using synaptic2
function! Addons_Syntastic ()
    let g:syntastic_check_on_open=1
    let g:syntastic_auto_jump=0
    let g:syntastic_javascript_checker = '/home/rok/node_modules/jshint/bin/hint'
    let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
endfunction

call extend(addons, [['Syntastic', ['default'], 'Addons_Syntastic']])

" }}}
" Gundo {{{

function! Addons_Gundo ()
    let g:gundo_debug = 1
    let g:gundo_preview_bottom = 1
    map <leader>G :GundoToggle<cr>
endfunction

call extend(addons, [['Gundo', ['default'], 'Addons_Gundo']])

" }}}
" Powerline {{{

function! Addons_Powerline ()
    let g:Powerline_symbols = 'fancy'
    "let g:Powerline_theme = 'skwp'
    "let g:Powerline_colorscheme = 'skwp'
endfunction

call extend(addons, [['Powerline', ['default'], 'Addons_Powerline']])

" }}}
" Ctrl-P {{{

function! Addons_ctrlp()
    let g:ctrlp_dont_split = 'NERD_tree_2'
    let g:ctrlp_jump_to_buffer = 0
    let g:ctrlp_map = '<leader>,'
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_match_window_reversed = 1
    let g:ctrlp_split_window = 0
    let g:ctrlp_max_height = 20
    let g:ctrlp_extensions = ['tag']

    let g:ctrlp_prompt_mappings = {
        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
        \ 'PrtHistory(-1)':       ['<c-n>'],
        \ 'PrtHistory(1)':        ['<c-p>'],
        \ 'ToggleFocus()':        ['<c-tab>'],
        \ }

    nnoremap <leader>. :CtrlPBuffer<cr>
endfunction

call extend(addons, [['ctrlp', ['default'], 'Addons_ctrlp']])

" }}}
" vim-orgmode {{{

function! Addons_orgmode ()
    "let g:org_plugins = ['ShowHide', '|', 'Navigator', 'EditStructure', '|', 'Todo', 'Date', 'Misc']
    "let g:org_todo_keywords = ['TODO', '|', 'DONE']
    let g:org_debug = 1
endfunction

call extend(addons, [['vim-orgmode', ['default'], 'Addons_orgmode']])

" }}}
" Gist {{{

function! Addons_Gist ()
    let g:gist_detect_filetype = 1  " detect filetype from filename
    let g:gist_open_browser_after_post = 1  " open browser after the post
endfunction

call extend(addons, [['Gist', ['default'], 'Addons_Gist']])

" }}}
" fugitive {{{

function! Addons_fugitive ()
    map <LEADER>gg :Git
    map <LEADER>gr :Gremove
    map <LEADER>gm :Gmove
    map <LEADER>gs :Gstatus<CR>
    map <LEADER>gd :Gdiff<CR>
endfunction

call extend(addons, [['fugitive', ['default'], 'Addons_fugitive']])

" }}}
" TaskList {{{

function! Addons_TaskList ()
    map <LEADER>tt <Plug>TaskList
endfunction

call extend(addons, [['TaskList', ['default'], 'Addons_TaskList']])

" }}}
" Tagbar {{{

function! Addons_Tagbar()
    nmap <LEADER>tb :TagbarToggle<CR>
endfunction

call extend(addons, [['Tagbar', ['default'], 'Addons_Tagbar']])

" }}}
" Solarized {{{

function! Addons_Solarized ()
    call togglebg#map("<LEADER>C")
    let g:solarized_termcolors = 256
    let g:solarized_hitrail = 1
    let g:solarized_diffmode = "high"
endfunction

call extend(addons, [['Solarized', ['default'], 'Addons_Solarized']])

" }}}
" sessionman {{{

function! Addons_sessionman()
    map <LEADER>ss :SessionSave<CR>
    map <LEADER>sa :SessionSaveAs
    map <LEADER>sc :SessionClose<CR>
    map <LEADER>sl :SessionList<CR>
endfunction

call extend(addons, [['sessionman', ['default'], 'Addons_sessionman']])

" }}}
" utl {{{

function! Addons_utl()
    let utl_opt_verbose=1
    "map <LEADER>X :let @*=expand("%:p")<CR>
    map <LEADER>xx :Utl<CR>
endfunction

call extend(addons, [['utl', ['default'], 'Addons_utl']])

" }}}

" Here we initialize above addons setting and we only load plugins for category
" provided
let addons_to_activate = []
let settings_to_activate = []
for addon in addons

    if (index(addon[1], a:category) != -1) || (a:category == 'default')
        call extend(addons_to_activate, [addon[0]])
        if exists("addon[2]")
            call extend(settings_to_activate, [addon[2]])
        endif
    endif

endfor

call vam#ActivateAddons(addons_to_activate, {
        \ 'auto_install': 1,
        \ 'plugin_root_dir': $HOME.'/.vim/addons',
        \ 'scm_merge_stategy': 'force',
        \ 'known_repos_activation_policy': 'ask',
        \ })

for addon_function in settings_to_activate
    :call call(function(addon_function), [])
endfor

" }}}
" Basic options ----------------------------------------------------------- {{{
" General options {{{
set nocompatible
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set cpoptions+=J
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿
set ttimeout
set notimeout
set nottimeout
set autowrite
set shiftround
set autoread
set title
set linebreak
"set dictionary=/usr/share/dict/words
set completeopt=longest,menuone,preview  " Better Completion
set pastetoggle=<F2>  " Toggle paste

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Save when losing focus
"au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" set all window splits equal
set equalalways

" }}}
" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Tabs, spaces, wrapping {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=+1

" }}}
" Backups {{{

set backupdir=~/.vim/tmp/backup// " backups
set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*¬
set undodir=~/.vim/tmp/undo//     " undo files
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

" }}}
" Color scheme {{{

syntax on
filetype on
filetype plugin on
filetype plugin indent on
"colorscheme molokai
"colorscheme wombat
colorscheme solarized
set background=dark
"set background=light

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight lines that are longer then 80
match ErrorMsg '\%>80v.+'

" }}}
" }}}
" Searching and movement -------------------------------------------------- {{{
" General {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

runtime macros/matchit.vim
map <tab> %

" Made D behave
nnoremap D d$

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Window resizing
nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" }}}
" Error navigation {{{
"
"             Location List     QuickFix Window
"            (e.g. Syntastic)     (e.g. Ack)
"            ----------------------------------
" Next      |     M-j               M-Down     |
" Previous  |     M-k                M-Up      |
"            ----------------------------------
"
nnoremap ∆ :lnext<cr>zvzz
nnoremap ˚ :lprevious<cr>zvzz
inoremap ∆ <esc>:lnext<cr>zvzz
inoremap ˚ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz

" }}}
" Directional Keys {{{

" It's 2011.
noremap j gj
noremap k gk

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v

" }}}
" Highlight word {{{

nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" }}}
" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}
" }}}
" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zz recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zz zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Destroy infuriating keys ------------------------------------------------ {{{

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
inoremap # X<BS>#

" Use L, dammit.
nnoremap Ajk <nop>
nnoremap A<esc> <nop>

" }}}
" Various filetype-specific stuff ----------------------------------------- {{{
" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END

" }}}
" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal ts=2 sts=2 sw=2
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties. Turns this:
    "
    " p {
    " width: 200px;
    " height: 100px;
    " background: red;
    "
    " ...
    " }
    "
    " into this:
    "
    " p {
    " background: red;
    " height: 100px;
    " width: 200px;
    "
    " ...
    " }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" HTML {{{

augroup ft_html
    au!

    au BufNewFile,BufRead *.html *.pt *.zcml setlocal filetype=html
    au FileType html setlocal foldmethod=manual
    au Filetype html setlocal ts=2 sts=2 sw=2

    " Use <localleader>f to fold the current tag.
    au FileType html nnoremap <buffer> <localleader>f Vatzf


    " Use Shift-Return to turn this:
    " <tag>|</tag>
    "
    " into this:
    " <tag>
    " |
    " </tag>
    au FileType html nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    " Smarter pasting
    au FileType html nnoremap <buffer> p :<C-U>YRPaste 'p'<CR>v`]=`]
    au FileType html nnoremap <buffer> P :<C-U>YRPaste 'P'<CR>v`]=`]
    au FileType html nnoremap <buffer> π :<C-U>YRPaste 'p'<CR>
    au FileType html nnoremap <buffer> ∏ :<C-U>YRPaste 'P'<CR>

augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au Filetype javascript setlocal ts=2 sts=2 sw=2

    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

augroup END

" }}}
" Lisp {{{

augroup ft_lisp
    au!
    au FileType lisp call TurnOnLispFolding()
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" }}}
" Nginx {{{

augroup ft_nginx
    au!

    au BufNewFile,BufRead /etc/nginx/conf/* set ft=nginx
    au BufNewFile,BufRead /etc/nginx/sites-available/* set ft=nginx
    au BufNewFile,BufRead /usr/local/etc/nginx/sites-avaialble/* set ft=nginx
    au BufNewFile,BufRead vhost.ngingx set ft=nginx

    au FileType nginx setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" OrgMode {{{

augroup ft_org
    au!

    au Filetype org nmap <buffer> Q vahjgq
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    "au FileType python noremap <buffer> <localleader>rr :RopeRename<CR>
    "au FileType python vnoremap <buffer> <localleader>rm :RopeExtractMethod<CR>
    "au FileType python noremap <buffer> <localleader>ri :RopeOrganizeImports<CR>

    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    "au FileType python compiler unit2
    "au FileType man nnoremap <buffer> <cr> :q<cr>
augroup END

" }}}
" ReStructuredText {{{

augroup ft_rest
    au!

    au FileType rst nnoremap <buffer> <localleader>1 yypVr=
    au FileType rst nnoremap <buffer> <localleader>2 yypVr-
    au FileType rst nnoremap <buffer> <localleader>3 yypVr~
    au FileType rst nnoremap <buffer> <localleader>4 yypVr`
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" }}}
" Convenience mappings ----------------------------------------------------- {{{

nmap <LEADER>L :set list!<CR>
map <SILENT> <LEADER>S :set spell!<CR>
map <SILENT> <LEADER>H :set hlsearch!<CR>¬
map <SILENT> <LEADER>N :set number!<CR>

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Change case
nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Formatting, TextMate-style
nnoremap <leader>w gqip

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>

" Less chording
nnoremap ; :

" Faster Esc
inoremap jj <esc>

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}
" GUI {{{

if has('gui_running')

    set guifont=Menlo\ Regular\ for\ Powerline:h12
    set antialias

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Use a line-drawing char for pretty vertical splits.
    set fillchars+=vert:│

    " Different cursors for different modes.
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    "set guicursor+=i:blinkwait10

    "set guicursor=n-c:block-Cursor-blinkon0
    "set guicursor+=v:block-vCursor-blinkon0
    "set guicursor+=i-ci:ver100-iCursor
    set guicursor+=a:blinkon0  " Disable all blinking:

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz

        " Use the normal HIG movements, except for M-Up/Down
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    else
        " Non-MacVim GUI, like Gvim
    end

" }}}
" Console UI {{{
else

endif
" }}}

endfun
