# Created by oscar
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Parts about having as much history as needed
export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE

# Export the sudoer
export SUDO_EDITOR=/usr/bin/nvim

alias gst='git status'
alias ll='ls -lah --color=auto'
alias ls='ls --color=auto'
alias th='cd ~/repos/thesis/'
alias rr='ranger'

# Colors
autoload -U colors && colors
autoload -Uz compinit
compinit

# FZF and associated keybindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Set the prompt
export TERM=xterm-256color
export PURPLE=$(tput setaf 141)
export RESET="$(tput sgr0)"
export PS1="${PURPLE}arch-linux-oscar${RESET}$ "

export FZF_TMUX=1

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"

# For getting syntax highlighting - installing the highlighting on the system
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Environment variables for ghcup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"