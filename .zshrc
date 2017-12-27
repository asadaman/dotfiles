autoload colors
colors


# prompt
local p_uh="%F{cyan}%n@%m%f"
local p_cd="%F{green}%~%f"
local p_pr="%(!,#,$)"

PROMPT="$p_uh: $p_cd
$p_pr "


# rprompt (git)
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
	    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
	    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}
RPROMPT=$'$(vcs_info_wrapper)'


# lsの色
autoload -U compinit
compinit

export LSCOLORS=cxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# alias
alias la="ls -a -l"
alias ll="ls -l"
alias v="nvim"
alias g="git"
alias fig="docker-compose"
alias aws-ecr-login='$(aws ecr get-login --registry-ids 716083991437 --no-include-email --region ap-northeast-1)'

export PATH="/usr/local/opt/opencv3/bin:$PATH"
