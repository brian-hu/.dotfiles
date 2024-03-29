#!/usr/bin/env zsh

pushd $HOME
pushd $DOTFILES

[[ ! -d $HOME/.fzf ]] && git clone https://github.com/junegunn/fzf.git $HOME/.fzf

if [[ "$EUID" -eq 0 ]]; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
    rm lazygit.tar.gz
fi

folders=(
    "tmux"
)

for folder in "${folders[@]}"
do
    if [[ -d "$folder" ]]
    then
        stow -D $folder
        stow $folder
    fi
done
popd
source $HOME/.zshrc
