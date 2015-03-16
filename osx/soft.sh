#!/bin/sh

function i {
  brew install "$@"
}

function tap {
  brew tap "$@"
}


tap homebrew/dupes
tap homebrew/versions
tap homebrew/php
tap homebrew/completions
tap homebrew/nginx

# common
i bash zsh wget
i bash-completion zsh-completions
i vim --override-system-vi

# databases
i postgres
i mongo

# languages
i nodejs iojs
i python
i ruby
i rust
i php56 --with-fpm --with-gmp --without-pear
i php56-xdebug php56-vld

brew cleanup
