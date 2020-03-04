export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
export PATH="~/dev/google-cloud-sdk/bin:$PATH"
export PATH=$PATH:$HOME/dev/google-cloud-sdk/bin
export PATH=$PATH:$HOME/dev/go_appengine

zplug "themes/blinks", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# 問題があったらコメントを戻す
# zplug load --verbose
zplug load

export CLICOLOR=1

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# alias
alias gls="gls --color"
alias la="ls -a -l"
alias ll="ls -l"
alias v="nvim"
alias g="git"
alias fig="docker-compose"

export PATH="/usr/local/opt/opencv3/bin:$PATH"
