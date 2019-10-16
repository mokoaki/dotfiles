#!/bin/bash

xcode-select --install 2> /dev/null

if ! type brew &> /dev/null ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install \
git \
openssl libyaml libffi rbenv ruby-build \
coreutils awscli \
zsh zsh-git-prompt peco \
nodenv node-build \
yarn \
awscli aws-sam-cli \
2> /dev/null

brew doctor

echo zsh
echo sudo vi /etc/shells # /usr/local/bin/zsh を追記
echo chsh -s /usr/local/bin/zsh
