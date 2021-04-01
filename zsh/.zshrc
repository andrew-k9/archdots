# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/andrew/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(
  asdf
	fzf
  git
  zsh-autosuggestions
)

# Auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# Include hidden files
_comp_options+=(globdots)

# Vim keys when in tab complete menu
bindkey -M menuselect 'h' vi-backwards-char
bindkey -M menuselect 'k' vi-up-line-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Kitty 
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

source $ZSH/oh-my-zsh.sh

## Programming languages
. $HOME/.asdf/asdf.sh


