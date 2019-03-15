# Source localised configuration
if [ -f ~/.zsh_local ]; then
  . ~/.zsh_local
fi

# Load aliases
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# History file settings {{{

HISTFILE=~/.histfile
HISTSIZE=4000
SAVEHIST=4000
# No duplicates in command history
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
# Prevent commands beginning with a space from appearing in history
setopt HIST_IGNORE_SPACE

# }}}

# Use vi key bindings
bindkey -v
# Bind jj to enter normal mode
bindkey "jj" vi-cmd-mode

# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Shift-TAB cycles completions backwards
bindkey '^[[Z' reverse-menu-complete
# Fix behaviour of backspace and delete keys
bindkey -v '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Enable color support of ls and other commands and also add handy aliases {{{

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Function for activating python virtual environments
workon() {
  if (( $# != 1 ))
  then
    echo "Usage: workon <envname>"
  else
    source ~/.virtualenvs/$1/bin/activate
  fi
}

# }}}

# Add my locally installed programs to path {{{

if [[ $PATH != *"/.local/bin"* ]]; then
  export PATH=${HOME}/.local/bin:$PATH
fi

if [[ $PATH != *"${HOME}/bin"* ]]; then
  export PATH=${HOME}/bin:$PATH
fi

# }}}

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# }}}
