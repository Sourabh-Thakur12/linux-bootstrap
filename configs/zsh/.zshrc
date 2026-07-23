# Created by newuser for 5.9
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export _ZO_FZF=fzy
eval "$(fnm env --use-on-cd --shell zsh)"

#alias
alias ls="eza --icons"
alias ll="eza -lh --icons"
alias la="eza -lha --icons"
alias cat="batcat"
alias j='z'
alias ji='zi'


# ---- Git aliases ----

alias g='git'

alias ga='git add'
alias gaa='git add .'

alias gc='git commit'
alias gcm='git commit -m'

alias gst='git status'
alias gl='git log'
alias glo='git log --oneline'

alias gp='git push'
alias gpl='git pull'

alias gsw='git switch'
alias gsc='git switch -c'

alias gco='git checkout'
alias gcb='git checkout -b'

alias gd='git diff'

alias gb='git branch'
alias gba='git branch -a'

alias gr='git restore'
alias grs='git restore --staged'

#Defaults
export EDITOR=nvim
export VISUAL=nvim


# ---- ZSH plugins ----


# completion system
autoload -Uz compinit
compinit -C

# nicer completion UI
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''

# autosuggestions (gray suggestions while typing)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf keybindings
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

#neovim
export PATH="$PATH:/opt/nvim/"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

#yazi 

function y() {
  local last="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$last"
    if [ -f "$last" ]; then
      local cwd
      cwd="$(cat "$last")"
        [ -n "$cwd" ] && cd -- "$cwd"
        rm -f -- "$last"
    fi
}

export PATH=$PATH:$HOME/go/bin


# vim
bindkey -v
export KEYTIMEOUT=1

#fix backspace
bindkey '^?' backward-delete-char

#movement
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

#fzf history 
#bindkey '^R' fzf-history-widget

# syntax highlighting (MUST BE LAST)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# opencode
export PATH=/home/sourabh/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
