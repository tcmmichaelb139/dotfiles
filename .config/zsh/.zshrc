# export ZSH="/home/tcmb139/.config/zsh/.oh-my-zsh"
# ZSH_THEME="awesomepanda"
# plugins=(git)

# source $ZSH/oh-my-zsh.sh

# colors
autoload -U colors && colors
# PS1="%B%{$fg[magenta]%}➜ %{$fg[yellow]%}[%{$fg[blue]%}%c%{$fg[yellow]%}] %{$fg[magenta]%}✗%{$reset_color%}%b "
PS1="%B%{$fg[magenta]%}➜  %{$fg[blue]%}%c%{$fg[magenta]%} ✗%{$reset_color%}%b "

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

bindkey -v
export KEYTIMEOUT=1

bindkey '^H' backward-kill-word
bindkey '^l' autosuggest-accept

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#aliases
alias cp='cp -i'                          # confirm before overwriting something
alias rm='rm -i'
alias mv='mv -i'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more='less'
alias q='exit'
alias c='clear'
alias h='history'
alias cs='clear;ls'
alias ls='ls --color=auto'
alias grep='ls --color=auto'
alias la='ls -A'
alias l='ls -l'
alias home='cd ~'
alias root='cd /'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
# alias vim='nvim'

export EDITOR='nvim'
export PATH=$PATH:~/.scripts

# for cp
ulimit -s unlimited

#syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
