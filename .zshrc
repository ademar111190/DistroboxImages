if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

export vim=nvim
export VISUAL=$vim
export EDITOR="$VISUAL"
export LC_ALL=en_US.UTF-8

alias ls="exa --icons"
alias la="exa -alh --icons"
alias cat=bat

alias v=$vim
alias vi=$vim
alias vim=$vim

alias clear-branchs="git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh