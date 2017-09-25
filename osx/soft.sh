#!/bin/sh

brew tap homebrew/nginx
brew tap homebrew/dupes
brew tap homebrew/services
brew tap homebrew/versions
brew tap homebrew/completions

# common
brew install htop
brew install wget curl
brew install bash bash-completion
brew install docker-completion docker-clean
brew install rpm
brew install cocoapods

# databases
brew install postgresql

# languages
brew install go rust scala
brew install nvm node yarn

brew cleanup
