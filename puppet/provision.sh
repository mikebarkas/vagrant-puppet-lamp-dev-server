#!/bin/sh

#
# Update system.
#
apt-get update -y

#
# Install basic utilities.
#
apt-get install -y -q vim
apt-get install -y -q unzip zip
apt-get install -y -q git

#
# Install zsh.
#
apt-get install -y -q zsh

if [ ! -d ~vagrant/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~vagrant/.oh-my-zsh
fi

cp ~vagrant/.oh-my-zsh/templates/zshrc.zsh-template ~vagrant/.zshrc
chown vagrant: ~vagrant/.zshrc
sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~vagrant/.zshrc
chsh -s /bin/zsh vagrant
