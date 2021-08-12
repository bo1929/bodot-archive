# To track configurations and dotfiles
alias config='/usr/bin/git --git-dir=$HOME/Files/misc/bodot/ --work-tree=$HOME'

# Colorize the ls output
alias ls='ls --color=auto'
# Use a long listing format
alias ll='ls -la'
# Show hidden files
alias l.='ls -d .* --color=auto'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
## alias dir='dir --color=auto'
## alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ssh aliases
# set TERM
alias ssh='TERM=xterm-256color ssh'

# Third-party applications
# lfcd.
LFCD="/home/bo/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
# signal with tray.
alias signal="signal-desktop --use-tray-icon"
# cat with wings.
alias cat=bat
# zathura leaves terminal.
alias zathura="zathura --fork"
