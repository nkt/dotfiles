function init_bash_completion {
  source $(brew --prefix)/etc/bash_completion
}

function init_ps1 {
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] ❯\[\033[00m\] '
}

function init_nvm {
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
}

init_bash_completion
init_ps1
init_nvm

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Exports
export EDITOR='/usr/local/bin/subl'
export REACT_EDITOR='/usr/local/bin/atom'
export GOPATH='/Users/nkt/Projects/go'

export PATH=$PATH:node_modules/.bin
export PATH=$PATH:/usr/local/opt/ruby/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# Aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ds='cd ~/Desktop'
alias p='cd ~/Projects'
alias e='$EDITOR'

alias ls='ls -FhlG'
alias la='ls -a'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Lock the screen (when going AFK)
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Reload the shell (i.e. invoke as a login shell)
alias reload='exec $SHELL -l'

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Functions

function compress_tar {
  tar czf $1.tar.gz $1
}

function cleanup {
  find $1 -name ".DS_Store" -depth -exec rm {} \;
}
