#!/usr/bin/env zsh

pushd $HOME
rm -rf .oh-my-zsh
export RUNZSH="no"
# install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

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
