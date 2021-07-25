let &packpath = &runtimepath

let plugins_path=stdpath('config') . '/plugins.vim'
if filereadable(expand(plugins_path))
    exec 'source ' . plugins_path
endif
let misc_path=stdpath('config') . '/misc.vim'
if filereadable(expand(misc_path))
    exec 'source ' . misc_path
endif
let mappings_path=stdpath('config') . '/mappings.vim'
if filereadable(expand(mappings_path))
    exec 'source ' . mappings_path
endif
let settings_path=stdpath('config') . '/settings.vim'
if filereadable(expand(settings_path))
    exec 'source ' . settings_path
endif
