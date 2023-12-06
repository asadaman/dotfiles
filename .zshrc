export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

eval "$(sheldon source)"

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

# imagemagick
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/imagemagick@6/lib"
export CPPFLAGS="-I/opt/homebrew/opt/imagemagick@6/include"

# pyenv
export PATH="${HOME}/.pyenv/shims:${PATH}"

# nvm
export NVM_DIR="$HOME/.nvm"

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm

[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export NODE_OPTIONS="--max-old-space-size=8192"
export PATH=$PATH:$HOME
