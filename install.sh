#!/bin/bash

VIMDIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"
WD=`pwd`

TIME=`date +%Y_%m_%d_%H_%M_%S`

if [ -f "$VIMRC" ] ; then
	mv "$VIMRC" "$VIMRC.$TIME"
fi
ln -s "$WD/vimrc1" "$HOME/.vimrc" 

if [ -d "$VIMDIR" ] ; then
	mv "$VIMDIR" "$VIMDIR.$TIME"
fi
mkdir  "$VIMDIR"

cp -a plugin template "$VIMDIR"  

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd
# install plugins
vim +PluginInstall +qall

# copy php-doc to plugin
