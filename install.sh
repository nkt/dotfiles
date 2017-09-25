#!/bin/sh

function setup_osx_hostname {
  HOSTNAME=$1
  COMPNAME=$(echo $HOSTNAME | tr '-' '.')

  if [[ $(scutil --get HostName) != "$HOSTNAME" ]]; then
    scutil --set HostName "$HOSTNAME"
    scutil --set ComputerName "$COMPNAME"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPNAME"
  fi
}

function clone_dotfiles {
  if [ ! -d ~/Projects/nkt/dotfiles ]; then
    mkdir -p ~/Projects/nkt && cd $_
    git clone git://github.com/nkt/dotfiles.git
  fi
}

function setup_dotfiles {
  ln -sf ~/Projects/nkt/dotfiles/files/.npmrc ~/.npmrc
  ln -sf ~/Projects/nkt/dotfiles/files/.yarnrc ~/.yarnrc
  ln -sf ~/Projects/nkt/dotfiles/files/.bashrc ~/.bash_profile
  ln -sf ~/Projects/nkt/dotfiles/files/.gitconfig ~/.gitconfig
  ln -sf ~/Projects/nkt/dotfiles/files/.gitignore_global ~/.gitignore_global
}

function install_brew {
  which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function setup_soft {
  sh ~/Projects/nkt/dotfiles/osx/soft.sh
}

function link_sublime {
  ln -sf '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' /usr/local/bin
}

function setup_atom {
  ln -sf ~/Projects/nkt/dotfiles/etc/atom/styles.less ~/.atom/styles.less
  ln -sf ~/Projects/nkt/dotfiles/etc/atom/config.cson ~/.atom/config.cson
  ln -sf ~/Projects/nkt/dotfiles/etc/atom/snippets.cson ~/.atom/snippets.cson
}

function setup_etcfiles {
  sudo cp -f ~/Projects/nkt/dotfiles/osx/etc/* /etc
}

if [[ `uname` == 'Darwin' ]]; then
  setup_osx_hostname "osx-nkt"

  clone_dotfiles
  setup_dotfiles

  install_brew
  setup_soft
  link_sublime
  setup_atom

  setup_etcfiles
fi
