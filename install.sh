#!/bin/bash
#######################################################################
#                  Installation script for dotfiles                   #
#######################################################################

#get z from rupa´s repo and install at ~/code/z
mkdir -p $HOME/code/z
cd $HOME/code/z
git clone https://github.com/rupa/z

#copy files to home directory

cp bashrc $HOME/.bashrc
cp aliases $HOME/.aliases
cp functions $HOME/.functions
cp ackrc $HOME/.ackrc
cp bash_prompt $HOME/.bash_prompt
cp osx $HOME/.osx #execute with . .osx if you want the defaults check before
cp inputrc $HOME/.inputrc
cp vimrc $HOME/.vimrc
