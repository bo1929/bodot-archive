## Source source configuration:
if [[ -e "${HOME}/.config/zsh/main.zsh" ]]; then
    source "${HOME}/.config/zsh/main.zsh"
fi

fpath=("${HOME}/.config/zsh/zsh-completions/src" ${fpath})

## Source misc:
if [[ -e "${HOME}/.config/zsh/misc.sh" ]]; then
    source "${HOME}/.config/zsh/misc.sh" 
fi

## Source dir_colors:
test -r "${HOME}/.config/zsh/.dir_colors" && eval $(dircolors "${HOME}/.config/zsh/.dir_colors")

## Source conda initializaiton:
if [[ -e "${HOME}/.config/zsh/conda.zsh" ]]; then
    source "${HOME}/.config/zsh/conda.zsh" 
fi

## Source aliases:
if [[ -e "${HOME}/.config/zsh/aliases.zsh" ]]; then
    source "${HOME}/.config/zsh/aliases.zsh" 
fi

if [[ -e "${HOME}/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "/home/bo/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
