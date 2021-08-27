## Source misc:
path_misc="${HOME}/.config/zsh/misc.sh" 
if [[ -e ${path_misc} ]]; then
    source ${path_misc}
fi

## Source dir_colors:
path_dircolors="${HOME}/.config/zsh/.dircolors" 
test -r ${path_dircolors} && eval $(dircolors ${path_dircolors})

## Source aliases:
path_aliases="${HOME}/.config/zsh/aliases.zsh" 
if [[ -e ${path_aliases} ]]; then
    source ${path_aliases}
fi

path_completion="${HOME}/.config/zsh/zsh-completions/src" 
fpath=(${path_completion} ${fpath})

path_suggestions="${HOME}/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" 
if [[ -e ${path_suggestions} ]]; then
    source ${path_suggestions}
fi

## Source source configuration:
path_main="${HOME}/.config/zsh/main.zsh" 
if [[ -e ${path_main} ]]; then
    source ${path_main}
fi

path_syntax="${HOME}/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 
if [[ -e ${path_syntax} ]]; then
    source ${path_syntax}
fi
