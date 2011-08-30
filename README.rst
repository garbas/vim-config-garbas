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
    
    call vim_config_garbas#plugins('all')
    call vim_config_garbas#config('all')
    
    let $PYTHONPATH = $HOME."/dev/py-pyflakes:".$HOME."/dev/py-pep8".$PYTHONPATH
    let $PATH = $HOME."/dev/py-pep8/bin:".$HOME."/dev/py-pyflakes/bin".$PATH
    
    let g:github_user = 'garbas'
    let g:github_token = 'XXXXXX'
