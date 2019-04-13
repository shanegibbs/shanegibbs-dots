#!/bin/bash -ex

DOTS=$HOME/.shanegibbs-dots

if [ ! -d "$DOTS" ]; then
  git clone --recursive https://github.com/shanegibbs/shanegibbs-dots.git $DOTS
fi

# DOTS=`dirname "$(readlink -f $0)"`

echo $DOTS

ln -fs $DOTS/gitconfig $HOME/.gitconfig
ln -fs $DOTS/gitignore $HOME/.gitignore
ln -fs $DOTS/tmux.conf $HOME/.tmux.conf
ln -fs $DOTS/vimrc $HOME/.vimrc
ln -nfs $DOTS/vim $HOME/.vim
