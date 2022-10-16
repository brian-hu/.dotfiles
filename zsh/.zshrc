export DOTFILES=$HOME/.dotfiles
export STOW_FOLDERS="nvim,zsh,ubuntu,tmux"

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
zinit snippet ~/.zsh-theme/everforest-dark.zsh

# install plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
    
# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -d "/usr/share/doc/fzf/examples" ] && source /usr/share/doc/fzf/examples/key-bindings.zsh && source /usr/share/doc/fzf/examples/completion.zsh
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# personal 
VIM="nvim"
alias v=$VIM
alias ls="ls --color=auto"
alias cs="~/.dotfiles/scripts/colorscheme.sh"

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
export PATH=$PATH:~/.local/bin
[ -f "$HOME/.local/share/solana/install/active_release/bin" ] && export PATH="$PATH:$HOME/.local/share/solana/install/active_release/bin" # solana
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# venv functions
mkvenv() {
    if [ -z "$1" ]
    then
        echo "Argument required"
    else
        python3 -m venv $HOME/.python_envs/$1
    fi
}
delvenv() {
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
