#!/bin/sh

cd ~

which git
has_git=$?
if [ $has_git -ne 0 ]; then
	echo "git not found"
	exit 1
fi

which zsh
has_zsh=$?
if [ $has_zsh -ne 0 ]; then
  echo "zsh not found"
  exit 1
fi

which vim
has_vim=$?
if [ $has_vim -ne 0 ]; then
  echo "vim not found"
fi

rm -rf /tmp/myrc && mkdir -p /tmp/myrc
git clone https://github.com/xnum/myrc.git /tmp/myrc
cp /tmp/myrc/.* ~/

# zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# vim config
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugin
vim +PluginInstall +qall
vim +GoInstallBinaries +qall
