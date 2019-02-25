# Load aliases
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Use vi key bindings
bindkey -v
# Bind jj to enter normal mode
bindkey "jj" vi-cmd-mode

# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Auto-Install ZPlugin {{{

ZPLUGIN="${ZDOTDIR:-$HOME}/.zplugin/bin/zplugin.zsh"

if [[ ! -f "$ZPLUGIN" ]]; then
  if (( $+commands[git] )); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
  else
    echo 'git not found' >&2
    exit 1
  fi
fi

source "$ZPLUGIN"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# }}}

# ZPlugin {{{

# Prompt
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" blockf lucid
zplugin light zsh-users/zsh-completions

# Syntax highlighting
zplugin ice lucid atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# }}}

# fzf {{{

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/haystack/.dotfiles/fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

# }}}
