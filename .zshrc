# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git 
    brew 
    starship 
    kubectl 
    kubectx 
    sdk 
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh

