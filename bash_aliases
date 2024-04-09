# Bash aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

# Move to parent directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gl="git log --graph --all --decorate"
alias gd="git diff"
alias gpush="git push"
alias gpull="git pull"
alias gco="git checkout"
alias gb="git branch"

# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format

# Misc aliases
alias v="vim"
alias python="python3"
alias reset-plank="killall plank; $HOME/.config/plank/replicate_dock.sh; nohup plank &"
