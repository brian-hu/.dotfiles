export DOTFILES=$HOME/.dotfiles
export CURRENT_THEME="sonokai-shusia"

source $HOME/.zshrc.bloomberg

# ls colors
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  

# install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -a $ZINIT_HOME ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# install theme
PURE_POWER_MODE=modern
zinit light romkatv/powerlevel10k
zinit snippet ~/.zsh-theme/sonokai-shusia.zsh

# install plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
    
# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# personal 
VIM="nvim"
alias v=$VIM
alias ls="ls --color=auto"
alias cs="~/.dotfiles/scripts/colorscheme.sh"
alias dc="docker compose"

# wsl commands
#alias xsvr='/mnt/c/Program\ Files/VcXsrv/vcxsrv.exe :0 -ac -multiwindow -clipboard -nowgl &> /dev/null &'
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')':0'
#export COLORTERM=truecolor

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt INC_APPEND_HISTORY_TIME

# path updates
export PATH=$PATH:$HOME/.local/bin
[ -f "$HOME/.local/share/solana/install/active_release/bin" ] && export PATH=$PATH:$HOME/.local/share/solana/install/active_release/bin # solana
[ -d "$HOME/.ghcup/bin" ] && export PATH=$PATH:$HOME/.ghcup/bin

# venv functions
mkvenv() {
    if [ -z "$1" ]
    then
        echo "Argument required"
    else
        if [ -z "$2" ]
        then
            python3 -m venv $HOME/.python_envs/$1
        else
            eval "$2 -m venv $HOME/.python_envs/$1"
        fi
    fi
}
rmvenv() {
    if [ -z "$1" ]
    then
        echo "Argument required"
    else
        rm -rf $HOME/.python_envs/$1
    fi
}
venv() {
    if [ -z "$1" ]
    then
        echo "Argument required"
    else
        source $HOME/.python_envs/$1/bin/activate
    fi
}

# iterm2 shell integration
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=true
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
if type it2setcolor &> /dev/null; then
    it2setcolor preset "${CURRENT_THEME}"
fi

it2prof() { echo -e "\033]50;SetProfile=$1\a" }
