#!/usr/bin/env zsh

THEME=$(printf "\
[1]  Gruvbox Material Dark\n\
[2]  Gruvbox Mix Dark\n\
[3]  Gruvbox Material Light\n\
[4]  Everforest Dark\n\
[5]  Everforest Light\n\
[6]  Sonokai\n\
[7]  Sonokai Shusia\n\
[8]  Sonokai Andromeda\n\
[9]  Sonokai Atlantis\n\
[10] Sonokai Maia\n\
[11] Sonokai Espresso\n" |\
fzf |\
sed -E -e 's/^\[//' -e 's/].*//')

if [ "$THEME"x = ""x ]; then
    exit
fi

_switch_color_scheme() {
    if [ -f ~/.dotfiles/config/.config/nvim/vimrc.vim ]; then
        sed -E -i.bak \
            -e "s/colorscheme .*/colorscheme ${3}/" \
            -e "s/let g:airline_theme='.*'/let g:airline_theme='${2}'/" \
            ~/.dotfiles/config/.config/nvim/vimrc.vim && \
            rm ~/.dotfiles/config/.config/nvim/vimrc.vim.bak
    fi
    if [ -f ~/.dotfiles/tmux/.tmux.conf ]; then
        sed -E -i.bak \
            "s/^source.*/source ~\/\.tmux\/tmuxline\/${1}\.tmux\.conf/" \
            ~/.dotfiles/tmux/.tmux.conf && \
            rm ~/.dotfiles/tmux/.tmux.conf.bak
    fi
    if [ -f ~/.dotfiles/zsh/.zshrc ]; then
        sed -E -i.bak \
            "s/\.zsh-theme\/.*/\.zsh-theme\/${1}\.zsh/" \
            ~/.dotfiles/zsh/.zshrc && \
            rm ~/.dotfiles/zsh/.zshrc.bak
        sed -E -i.bak \
            "s/CURRENT_THEME=\".*\"/CURRENT_THEME=\"${1}\"/" \
            ~/.dotfiles/zsh/.zshrc && \
            rm ~/.dotfiles/zsh/.zshrc.bak
    fi
    if [ -f ~/.dotfiles/alacritty/.alacritty.yml ]; then
        sed -E -i.bak \
            -e "s/\.alacritty-theme\/.*/\.alacritty-theme\/${1}\.yml/" \
            ~/.dotfiles/alacritty/.alacritty.yml && \
            rm ~/.dotfiles/alacritty/.alacritty.yml.bak
    fi

}

if [ "$THEME" = "1" ]; then
    export CURRENT_THEME="gruvbox-material-dark"
    _switch_color_scheme gruvbox-material-dark gruvbox_material gruvbox-material 
elif [ "$THEME" = "2" ]; then
    export CURRENT_THEME="gruvbox-mix-dark"
    _switch_color_scheme gruvbox-mix-dark gruvbox_material gruvbox-material
elif [ "$THEME" = "3" ]; then
    export CURRENT_THEME="gruvbox-material-light"
    _switch_color_scheme gruvbox-material-light gruvbox_material gruvbox-material
elif [ "$THEME" = "4" ]; then
    export CURRENT_THEME="everforest-dark"
    _switch_color_scheme everforest-dark everforest everforest
elif [ "$THEME" = "5" ]; then
    export CURRENT_THEME="everforest-light"
    _switch_color_scheme everforest-light everforest everforest
elif [ "$THEME" = "6" ]; then
    export CURRENT_THEME="sonokai-default"
    _switch_color_scheme sonokai sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='default'/" \
        ~/.dotfiles/config/.config/nvim/vimrc.vim && \
        rm ~/.dotfiles/config/.config/nvim/vimrc.vim.bak
elif [ "$THEME" = "7" ]; then
    export CURRENT_THEME="sonokai-shusia"
    _switch_color_scheme sonokai-shusia sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='shusia'/" \
        ~/.dotfiles/config/.config/nvim/vimrc.vim && \
        rm ~/.dotfiles/config/.config/nvim/vimrc.vim.bak
elif [ "$THEME" = "8" ]; then
    export CURRENT_THEME="sonokai-andromeda"
    _switch_color_scheme sonokai-andromeda sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='andromeda'/" \
        ~/.dotfiles/config/.config/nvim/vimrc.vim && \
        rm ~/.dotfiles/config/.config/nvim/vimrc.vim.bak
elif [ "$THEME" = "9" ]; then
    export CURRENT_THEME="sonokai-atlantis"
    _switch_color_scheme sonokai-atlantis sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='atlantis'/" \
        ~/.dotfiles/config/.config/nvim/vimrc.vim && \
        rm ~/.dotfiles/config/.config/nvim/vimrc.vim.bak
elif [ "$THEME" = "10" ]; then
    export CURRENT_THEME="sonokai-maia"
    _switch_color_scheme sonokai-maia sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='maia'/" \
        ~/.dotfiles/config/.config/nvim/vimrc.vim && \
        rm ~/.dotfiles/config/.config/nvim/vimrc.vim.bak
elif [ "$THEME" = "11" ]; then
    export CURRENT_THEME="sonokai-espresso"
    _switch_color_scheme sonokai-espresso sonokai sonokai
    sed -E -i.bak \
        "s/let g:sonokai_style='.*'/let g:sonokai_style='espresso'/" \
        ~/.dotfiles/config/.config/nvim/vimrc.vim && \
        rm ~/.dotfiles/config/.config/nvim/vimrc.vim.bak
fi

if [ -n "${TMUX}" ]; then
    tmux source-file ~/.tmux.conf
fi

source $HOME/.zshrc
