#!/bin/sh

function i {
  brew install "$@"
}

function tap {
  brew tap "$@"
}


tap homebrew/dupes
tap homebrew/versions
tap homebrew/completions
tap homebrew/php
tap homebrew/nginx
tap homebrew/services

# common
i bash bash-completion
i wget curl

# databases
i postgres
i mongo
i rethinkdb

# languages
i nodejs
i python
i ruby
i rust

brew cleanup
