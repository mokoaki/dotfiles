#!/bin/bash

xcode-select --install 2> /dev/null

if ! type brew &> /dev/null ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install \
git \
openssl libyaml libffi rbenv ruby-build \
coreutils awscli \
zsh zsh-git-prompt \
nodenv node-build \
yarn 2> /dev/null
