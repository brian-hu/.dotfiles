#!/usr/bin/env zsh
# I am using zsh instead of bash.  I was having some troubles using bash with
# arrays.  Didn't want to investigate, so I just did zsh
pushd $DOTFILES
for folder in * 
do
    if [-d "$folder"]
    then
        echo "Removing $folder"
        stow -D $folder
    fi
done
popd
