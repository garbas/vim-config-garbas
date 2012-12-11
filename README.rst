::

bootstrap VAM
=============

::

    mkdir ~/.vim/addons -p
    cd ~/.vim/addons
    git clone git://github.com/MarcWeber/vim-addon-manager.git


.vimrc
======

::

    set runtimepath+=$HOME/.vim/addons/vim-addon-manager
    call vam#ActivateAddons(['github:garbas/vim-config-garbas'], {'auto_install': 0})

    if !exists("$VIMCATEGORY")
        let $VIMCATEGORY = [ 'default', 'development', 'python', 'html', 'css', 'javascript' ]
    endif

    call garbas#config($VIMCATEGORY)
    
    let g:github_user = 'garbas'
    let g:github_token = 'XXXXXX'
