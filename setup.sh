#!/bin/bash -ex

DOTS=$HOME/.shanegibbs-dots

if [ ! -d "$DOTS" ]; then
  git clone --recursive git@github.com:shanegibbs/shanegibbs-dots.git $DOTS
fi

# DOTS=`dirname "$(readlink -f $0)"`

echo $DOTS

ln -fs $DOTS/gitconfig $HOME/.gitconfig
ln -fs $DOTS/tmux.conf $HOME/.tmux.conf
ln -fs $DOTS/vimrc $HOME/.vimrc
ln -nfs $DOTS/vim $HOME/.vim
ln -fs $DOTS/zshrc $HOME/.zshrc
ln -fs $DOTS/shanegibbs.zsh-theme $HOME/.oh-my-zsh/themes/shanegibbs.zsh-theme
