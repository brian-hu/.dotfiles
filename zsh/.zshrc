export DOTFILES=$HOME/.dotfiles
export STOW_FOLDERS="nvim,zsh,ubuntu,tmux"

# install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
mkdir -p "$(dirname $ZINIT_HOME)"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# install theme
zinit light romkatv/powerlevel10k
zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme/everforest-light.zsh

# install plugins
zinit ice wait lucid; zinit light zdharma-continuum/fast-syntax-highlighting 
zinit ice wait lucid; zinit light zsh-users/zsh-completions
zinit ice wait lucid; zinit light zsh-users/zsh-autosuggestions

# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -d "/usr/share/doc/fzf/examples" ] && source /usr/share/doc/fzf/examples/key-bindings.zsh && source /usr/share/doc/fzf/examples/completion.zsh

VIM="nvim"
alias v=$VIM

# wsl commands
#alias xsvr='/mnt/c/Program\ Files/VcXsrv/vcxsrv.exe :0 -ac -multiwindow -clipboard -nowgl &> /dev/null &'
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')':0'
#export COLORTERM=truecolor

# path updates
export PATH=$PATH:~/.local/bin
export PATH="/home/bhu/.local/share/solana/install/active_release/bin:$PATH"

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
