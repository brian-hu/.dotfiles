#!/usr/bin/env bash

THEME=$(printf "\
[1]  Gruvbox Material Dark\n\
[2]  Gruvbox Mix Dark\n\
[3]  Gruvbox Material Light\n\
[4]  Edge Dark\n\
[5]  Edge Light\n\
[6]  Everforest Dark\n\
[7]  Everforest Light\n\
[8]  Sonokai\n\
[9]  Sonokai Shusia\n\
[10] Sonokai Andromeda\n\
[11] Sonokai Atlantis\n\
[12] Sonokai Maia\n\
[13] Sonokai Espresso\n\
[14] Soft Era\n" |\
fzf |\
sed -E -e 's/^\[//' -e 's/].*//')

if [ "$THEME"x == ""x ]; then
    exit
fi

_switch_color_scheme() {
    if [ -f ~/.vimrc ]; then
        sed -E -i.bak \
            -e "s/colorscheme .*/colorscheme ${3}/" \
            -e "s/let g:airline_theme='.*'/let g:airline_theme='${2}'/" \
            ~/.vimrc && \
            rm ~/.vimrc.bak
    fi
    if [ -f ~/.tmux.conf ]; then
        sed -E -i.bak \
            "s/^source.*/source ~\/\.tmux\/tmuxline\/${1}\.tmux\.conf/" \
            ~/.tmux.conf && \
            rm ~/.tmux.conf.bak
    fi
    if [ -f ~/.zshrc ]; then
        sed -E -i.bak \
            "s/zsh-theme\/.*/zsh-theme\/${1}\.zsh/" \
            ~/.zshrc && \
            rm ~/.zshrc.bak
    fi
}

if [ "$THEME" == "1" ]; then
    _switch_color_scheme gruvbox-material-dark gruvbox_material gruvbox-material 
elif [ "$THEME" == "2" ]; then
    _switch_color_scheme gruvbox-mix-dark gruvbox_material gruvbox-material
elif [ "$THEME" == "3" ]; then
    _switch_color_scheme gruvbox-material-light gruvbox_material gruvbox-material
elif [ "$THEME" == "4" ]; then
    _switch_color_scheme edge-dark edge edge
elif [ "$THEME" == "5" ]; then
    _switch_color_scheme edge-light edge edge
elif [ "$THEME" == "6" ]; then
    _switch_color_scheme everforest-dark everforest everforest
elif [ "$THEME" == "7" ]; then
    _switch_color_scheme everforest-light everforest everforest
elif [ "$THEME" == "8" ]; then
    _switch_color_scheme sonokai sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='default'/" \
        ~/.vimrc && \
        rm ~/.vimrc.bak
elif [ "$THEME" == "9" ]; then
    _switch_color_scheme sonokai-shusia sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='shusia'/" \
        ~/.vimrc && \
        rm ~/.vimrc.bak
elif [ "$THEME" == "10" ]; then
    _switch_color_scheme sonokai-andromeda sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='andromeda'/" \
        ~/.vimrc && \
        rm ~/.vimrc.bak
elif [ "$THEME" == "11" ]; then
    _switch_color_scheme sonokai-atlantis sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='atlantis'/" \
        ~/.vimrc && \
        rm ~/.vimrc.bak
elif [ "$THEME" == "12" ]; then
    _switch_color_scheme sonokai-maia sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='maia'/" \
        ~/.vimrc && \
        rm ~/.vimrc.bak
elif [ "$THEME" == "13" ]; then
    _switch_color_scheme sonokai-espresso sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='espresso'/" \
        ~/.vimrc && \
        rm ~/.vimrc.bak
elif [ "$THEME" == "14" ]; then
    _switch_color_scheme soft-era soft-era soft-era
fi

if [ -n "${TMUX}" ]; then
    tmux source-file ~/.tmux.conf
fi
