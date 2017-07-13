### Core ###

# Emacs style shortcuts
bindkey -e

# Highlight the selected item in completion menu
zstyle ':completion:*' menu select

# Bash-style word boundary
autoload -U select-word-style
select-word-style bash


### My stuff ###

j () {
  eval `.j $@`
}

proxy () {
  source ~/.proxy-"$@"
}

noproxy () {
  unset http_proxy
  unset https_proxy
}
alias ls='ls --color=auto'
alias e='emacsclient -s term -a "" -nw -c'
proxy ss

source ~/.zplug/init.zsh
zplug "lib/history", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "popstas/zsh-command-time"
# zplug "modules/prompt", from:prezto
# Theme
zplug "bhilburn/powerlevel9k", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# My stuff
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

[ -r /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh

# # keep this line at the bottom of ~/.bashrc
# [ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
