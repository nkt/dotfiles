#!/usr/bin/env sh

HOSTNAME="osx-nkt"
COMPNAME=$(echo $HOSTNAME | tr '-' '.')
PUBKEY="$HOME/.ssh/id_rsa.pub"

if [[ `uname` == 'Darwin' ]]; then
    which -s brew
    if [[ $? != 0 ]]; then
        echo 'Installing Homebrew...'
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/homebrew/go/install)"
    fi

    mkdir -p "$HOME/Projects"

    echo 'Replacing default paths file...'
    sudo cp -f etc/osx/paths /etc/paths

    if [[ $(scutil --get HostName) != "$HOSTNAME" ]]; then
        scutil --set HostName "$HOSTNAME"
        scutil --set ComputerName "$COMPNAME"
        sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPNAME"
    fi
fi

echo 'Copying dotfiles...'
for dotfile in files/.*; do
    if [[ -f $dotfile ]]; then
        cp -f $dotfile "$HOME/"
    fi
done

if [[ ! -f "$PUBKEY" ]]; then
    echo 'Generating new SSH key..'
    ssh-keygen -t rsa -f "$PUBKEY"
fi
