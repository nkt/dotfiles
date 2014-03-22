alias ls='ls -FhlG'
alias lsa='ls -a'
alias ..='cd ..'
alias ...='cd ../..'
alias nginx-restart='sudo nginx -s stop && sudo nginx'
alias fpm-restart='sudo killall php-fpm; sudo php-fpm -D'
alias e='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HISTCONTROL=ignoredups

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
