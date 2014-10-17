#!/usr/bin/env sh

HOSTNAME="osx-nkt"
COMPNAME=$(echo $HOSTNAME | tr '-' '.')

echo 'Creating projects directory...'
mkdir "$HOME/Projects"

if [[ `uname` == 'Darwin' ]]; then
    which -s brew
    if [[ $? != 0 ]]; then
        echo 'Installing Homebrew...'
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/homebrew/go/install)"
    fi

    echo 'Replacing default paths file...'
    sudo cp -f etc/osx/paths /etc/paths

    scutil --set HostName "$HOSTNAME"
    scutil --set ComputerName "$COMPNAME"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPNAME"
fi

if [[ ! -f "$PUBKEY" ]]; then
    echo 'Generating new SSH key..'
    ssh-keygen -t rsa
fi

echo 'Symlink dotfiles...'
for dotfile in files/.*; do
    if [[ -f $dotfile ]]; then
        ln -s $dotfile "$HOME/"
    fi
done
