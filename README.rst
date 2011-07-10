
Example of configuration i'm using
----------------------------------

::

    set runtimepath+=~/dev/vim-addon-manager
    call vam#ActivateAddons(['vim-config-garbas'])
    
    call vim_config_garbas#plugins('all')
    call vim_config_garbas#config('all')
    
    let $PYTHONPATH = $HOME."/dev/py-pyflakes:".$HOME."/dev/py-pep8".$PYTHONPATH
    let $PATH = $HOME."/dev/py-pep8/bin:".$HOME."/dev/py-pyflakes/bin".$PATH
    
    let g:github_user = 'garbas'
    let g:github_token = 'af0f5562fd3b1fa133231e8da6c21183'
