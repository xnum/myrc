#!/bin/sh

cd ~

#install basic utils
if [ "$(whoami)" == "root" ]; then
	apt-get update
	apt-get install -y git tmux zsh curl
fi

#git
which git
$git = $?
if [ $git != 0 ]; then
	echo "You need to install git."
	exit
fi

#oh-my-zsh
which zsh
$zsh = $?
if [ $zsh == 0 ]; then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#tmux-powerline
which tmux
$tmux = $?
if [ $tmux == 0 ]; then
	git clone https://github.com/erikw/tmux-powerline.git
fi

# update config
cd ~
git init
git remote add origin https://github.com/xnum/myrc.git
git fetch --all
git reset --hard origin/master

# install vim plugin
vim +PluginInstall +qall


