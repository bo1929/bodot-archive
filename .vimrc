let plugin_path=$HOME."/.vim/plugins.vim"
if filereadable(expand(plugin_path))
    exec 'source ' . plugin_path
endif
let misc_path=$HOME."/.vim/misc.vim"
if filereadable(expand(misc_path))
    exec 'source ' . misc_path
endif
let mapping_path=$HOME."/.vim/mappings.vim"
if filereadable(expand(mapping_path))
    exec 'source ' . mapping_path
endif
let setting_path=$HOME."/.vim/settings.vim"
if filereadable(expand(setting_path))
    exec 'source ' . setting_path
endif
