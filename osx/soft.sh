#!/bin/sh

brew tap homebrew/nginx
brew tap homebrew/dupes
brew tap homebrew/services
brew tap homebrew/versions
brew tap homebrew/completions

# common
brew install wget curl
brew install bash bash-completion

# databases
brew install mongo
brew install postgres
brew install rethinkdb

# languages
brew install go
brew install rust
brew install nodejs
brew install python

brew cleanup
