# Use ~~ as the trigger sequence instead of the default **
## export FZF_COMPLETION_TRIGGER="~~"

# Options to fzf command
## export FZF_COMPLETION_OPTS='--border --info=inline'

# Default opt
bat_preview=" --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
layout=" --height 80% --layout=reverse --border"
export FZF_DEFAULT_OPTS="${bat_preview}${layout}"
