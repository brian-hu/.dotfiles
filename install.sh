#!/usr/bin/env zsh

pushd $HOME
rm -rf .oh-my-zsh
export RUNZSH="no"
# install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# install zsh plugins
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm .zshrc*
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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
