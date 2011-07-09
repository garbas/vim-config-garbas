"" inspired by https://github.com/MarcWeber/vim-addon-MarcWeber/blob/master/autoload/vim_addon_MarcWeber.vim

fun! vim_config_garbas#Activate(vam_features)

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
           \ || (type(a:vam_features) == type([]) && index(a:vam_features, k) >= 0)
           \ || (type(a:vam_features) == type('') && a:vam_features == 'all')
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

    au FileType python map <buffer> <LEADER>8 :call Pep8()<CR> 
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

    " pyflakes2441
    filetype plugin indent on
    if has("gui_running")
        highlight SpellBad term=underline gui=undercurl guisp=Red
    endif

    let g:github_user = 'garbas'
    let g:github_token = 'af0f5562fd3b1fa133231e8da6c21183'
    let g:gist_detect_filetype = 1  " detect filetype from filename
    let g:gist_open_browser_after_post = 1  " open browser after the post

endfun
