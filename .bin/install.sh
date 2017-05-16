#!/bin/sh

cd ~

sudo apt-get install -y git tmux zsh curl

#git
which git
git=$?
if [ $git -ne 0 ]; then
	echo "You need to install git."
	exit
fi

#oh-my-zsh
which zsh
zsh=$?
if [ $zsh -eq 0 ]; then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	RED='\033[0;31m'
	NC='\033[0m' # No Color
	printf "zsh ${RED}NOT FOUND${NC}\n"
fi

#tmux-powerline
which tmux
tmux=$?
if [ $tmux -eq 0 ]; then
	git clone https://github.com/xnum/tmux-powerline.git
fi

# update config
cd ~
git init
git remote add origin https://github.com/xnum/myrc.git
git fetch --all
git reset --hard origin/master

tmux source-file ~/.tmux.conf

# ch
cd ~
git clone https://github.com/xnum/ch.git
cd ch && chmod +x *.sh && ./install.sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugin
vim +PluginInstall +qall


