# Source misc.
ZSH_MISC="${HOME}/.config/zsh/misc.sh" 
if [[ -e ${ZSH_MISC} ]]; then
    source ${ZSH_MISC}
fi

# Source dir_colors.
ZSH_DIZSHOLORS="${HOME}/.config/zsh/.dircolors" 
test -r ${ZSH_DIZSHOLORS} && eval $(dircolors ${ZSH_DIZSHOLORS})

# Source aliases:
ZSH_ALIASES="${HOME}/.config/zsh/aliases.zsh" 
if [[ -e ${ZSH_ALIASES} ]]; then
    source ${ZSH_ALIASES}
fi

# Source plugins.
ZSH_PLUGINS="${HOME}/.config/zsh/plugins.zsh" 
if [[ -e ${ZSH_PLUGINS} ]]; then
    source ${ZSH_PLUGINS}
fi

# Source main configuration.
ZSH_MAIN="${HOME}/.config/zsh/main.zsh" 
if [[ -e ${ZSH_MAIN} ]]; then
    source ${ZSH_MAIN}
fi

# Zsh-Syntax-Highlighting, this must be sourced last.
DIR_ZSH_SYNTAX_HIGHLIGHTING="${HOME}/.config/zsh/zsh-syntax-highlighting"
if [ ! -d ${DIR_ZSH_SYNTAX_HIGHLIGHTING} ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${DIR_ZSH_SYNTAX_HIGHLIGHTING}
fi
ZSH_SYNTAX_HIGHLIGHTING="${ZSH_SYNTAX_HIGHLIGHTING}/zsh-syntax-highlighting.zsh"
if [[ -e ${ZSH_SYNTAX_HIGHLIGHTING} ]]; then
        source ${ZSH_SYNTAX_HIGHLIGHTING}/zsh-syntax-highlighting.zsh
fi

# Done!
