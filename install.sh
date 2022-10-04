#!/usr/bin/env zsh

pushd $HOME
pushd $DOTFILES
for folder in * 
do
    if [ -d "$folder" ]
    then
        stow -D $folder
        stow $folder
    fi
done
popd
source $HOME/.zshrc
