#!/bin/sh

if [ "$(whoami)" == "root" ]; then
	apt-get update
	apt-get install -y git tmux zsh curl
fi

cd ~
git init
git remote add origin https://github.com/xnum/myrc.git
git fetch --all
git reset --hard origin/master

vim +PluginInstall +qall
