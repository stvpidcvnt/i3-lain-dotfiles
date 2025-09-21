# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# aliases
[ -f "${XDG_CONFIG_HOME}/shell/aliases" ] && sourc     e "${XDG_CONFIG_HOME}/shell/aliases"

# options
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U compinit
compinit

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# theme/plugins
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/zsh-auto-notify/auto-notify.plugin.zsh
source ~/zsh-you-should-use/you-should-use.plugin.zsh

zstyle ':completion:*' menu select

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# auto notify options
AUTO_NOTIFY_IGNORE+=("lf" "hugo serve" "rofi")

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
