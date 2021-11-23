#!/usr/bin/env zsh
# I am using zsh instead of bash.  I was having some troubles using bash with
# arrays.  Didn't want to investigate, so I just did zsh
pushd $HOME
rm -rf .oh-my-zsh
export RUNZSH="no"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm .zshrc*

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -D $folder
    stow $folder
done
popd
source $HOME/.zshrc
