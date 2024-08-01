#!/bin/bash
#shellcheck disable=SC1090

case $- in
*i*) ;;
*) return ;;
esac

# ---------------------- local utility functions ---------------------

_have() { command -v "$1" &>/dev/null; }
_source_if() { [[ -r $1 ]] && . "$1"; }

# ----------------------- environment variables ----------------------
#                            (also see envx)

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

unset LANGUAGE LC_ALL
export LANG=C.UTF-8 # or en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=C.UTF-8
export LC_MESSAGES=C.UTF-8
export LC_MONETARY=C.UTF-8
export LC_NUMERIC=C.UTF-8
export LC_TIME=C.UTF-8

export USER="${USER:-$(whoami)}"
export GITUSER=fredrikfoss
export REPOS="$HOME/repo"
export GHREPOS="$REPOS/github.com/$GITUSER"
export SNIPPETS="$HOME/snips"
export LAB="$GHREPOS/lab"
export HELP_BROWSER=lynx
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export TEMPLATES="$HOME/templates"
export SCRIPTS="$HOME/bin"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Videos"
export PDFS="$GHREPOS/books/docs"
export BOOKS="$GHREPOS/books/docs"
export VIRTUALMACHINES="$HOME/VirtualMachines"
export WORKSPACES="$HOME/Workspaces" # container home dirs for mounting
export ZETDIR="$GHREPOS/zet"
export TMPDIR="${XDG_RUNTIME_DIR:-/tmp}"
export PAGER='less'
export MANPAGER='less --use-color'
export FFMPEG_DATADIR="$HOME/.config/ffmpeg"
export K9SCONFIG="$HOME/.config/k9s"
export KUBECONFIG="$HOME/.config/kube"
export KUBECACHEDIR="$HOME/.cache/kube"
export OLLAMA_MODELS="$HOME/.local/share/ollama/models"

if _have nvim; then
	export EDITOR='nvim'
	export VISUAL='nvim'
	export EDITOR_PREFIX='nvim'
else
	export EDITOR='vi'
	export VISUAL='vi'
	export EDITOR_PREFIX='vi'
fi

export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

# export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOPROXY=direct
export CGO_ENABLED=0

# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$HOME/.config/java"

export RUSTUP_HOME="$HOME/.local/share/rustup"
export CARGO_HOME="$HOME/.local/share/cargo"
export CARGO_INSTALL_ROOT="$HOME/.local"

export PYTHONDONTWRITEBYTECODE=2
export PYTHON_HISTORY="$HOME/.local/state/python/history"
export PYTHONPYCACHEPREFIX="$HOME/.cache/python"
export PYTHONUSERBASE="$HOME/.local/share/python"

export ANSIBLE_HOME="$HOME/.config/ansible"
export ANSIBLE_CONFIG="$HOME/.config/ansible/config.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="$HOME/.cache/ansible/galaxy_cache"
export ANSIBLE_INVENTORY="$HOME/.config/ansible/inventory.yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
# export ANSIBLE_STDOUT_CALLBACK=json

export DOCKER_CONFIG="$HOME/.config/docker"
export MACHINE_STORAGE_PATH="$HOME/.local/share/docker-machine"

export ARDUINO_CONFIG_FILE="$HOME/.config/arduino/arduino-cli.yaml"

if [[ -d /.vim/spell ]]; then
	export VIMSPELL=("$HOME/.vim/spell/*.add")
fi

# ------------------------------- path -------------------------------

pathprepend() {
	local arg
	for arg in "$@"; do
		[[ -d $arg ]] || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":$PATH"}"
	done
} && export -f pathprepend

pathappend() {
	local arg
	for arg in "$@"; do
		[[ -d $arg ]] || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

pathprepend \
	"$HOME/.local/go/bin" \
	"$HOME/.local/zig" \
	"$HOME/.local/quarto/bin" \
	"$HOME/.local/bin" \
	"$HOME/bin"

pathappend \
	/usr/local/go/bin \
	/usr/local/sbin \
	/usr/local/bin \
	/usr/sbin \
	/usr/bin \
	/snap/sbin \
	/snap/bin \
	/sbin \
	/bin

# ------------------------------- cdpath -----------------------------

export CDPATH=".:$GHREPOS:$REPOS:/media/$USER:/run/media/$USER:$HOME"

# --------------------------- shell options --------------------------

set -o vi                        # vi command line editing mode
shopt -s checkwinsize            # enable $COLUMNS and $ROWS
shopt -s expand_aliases          #
shopt -s globstar                # ** recursive glob
shopt -s dotglob                 #
shopt -s extglob                 #
shopt -s histappend              # append to history, don't overwrite
shopt -s histverify              # expand, but don't automatically execute, history expansions
shopt -s nocaseglob              # case-insensitive globbing
shopt -s no_empty_cmd_completion # do not TAB expand empty lines

# umask 002
# umask 027
umask 022

# ------------------------------ history -----------------------------

# export HISTFILE="$HOME/.local/state/bash/history"
export HISTCONTROL=ignoreboth # ignore duplicates
export HISTSIZE=100000        # amount of history to preserve
export HISTFILESIZE=200000    # max size of history file
export HISTIGNORE='?:??'      # ignore one and two letter commands

# -------------------------------- gpg -------------------------------

GPG_TTY=$(tty)
export GPG_TTY

# ----------------------------- age/rage -----------------------------

# PINENTRY_PROGRAM= # might not need after all with rage

# ---------------------------- pass/passage --------------------------

# [[ -f $HOME/.local/bin/rage ]] && export PASSAGE_AGE="$HOME/.local/bin/rage"

# export PA_DIR="$HOME/.pa/store"
export PA_LENGTH=25
export PA_PATTERN='[:graph:]'

# ------------------------------- pager ------------------------------

if [[ -x /usr/bin/src-hilite-lesspipe.sh ]]; then
	export LESSOPEN="|/usr/bin/src-hilite-lesspipe.sh %s"
elif [[ -x /usr/bin/lesspipe.sh ]]; then
	export LESSOPEN="||/usr/bin/lesspipe.sh %s"
elif [[ -x /usr/bin/lesspipe ]]; then
	export LESSOPEN="|/usr/bin/lesspipe %s"
	export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

# export LESS="-FR --use-color"
export LESS="-FR"
export LESSHISTFILE=-

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
	if [[ -r $HOME/.dircolors ]]; then
		eval "$(dircolors -b "$HOME/.dircolors")"
	else
		eval "$(dircolors -b)"
	fi
fi

# -------------------------- stty annoyances -------------------------

stty -ixon # disable control-s/control-q tty flow control

# ------------------------------ prompt ------------------------------

__ps1() {
	local prompt='$'
	local obrack='['
	local cbrack=']'
	local at='@'
	local dir="${PWD##*/}"
	local red='\[\e[91m\]'
	local green='\[\e[92m\]'
	local blue='\[\e[94m\]'
	local reset='\[\e[0m\]'

	[[ $PWD = / ]] && dir='/'
	[[ $PWD = "$HOME" ]] && dir='~'
	[[ $EUID == 0 ]] && prompt='#' && green=$red

	PS1="${reset}${obrack}${green}\u${at}\h ${blue}${dir}${reset}${cbrack}${prompt}${reset} "
}

PROMPT_COMMAND="__ps1"

# ------------------------------ aliases -----------------------------

unalias -a

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias todo='${EDITOR:-vi} ~/Documents/todo.md'
alias ip='ip --color=auto'
alias free='free -h'
alias ls='ls -hF --color=auto --time-style iso'
alias l='ls -lahF --color=auto --time-style iso'
alias grep='grep --color=auto'
alias rg='rg -Suu'
alias fd='fd -u'
alias tree='tree -a -I .git/'
alias df='df -h'
alias diff='diff --color=auto'
alias temp='cd $(mktemp -d) && pwd'
alias view='${EDITOR:-vi} -R'
alias clear='printf "\e[H\e[2J"'
alias c=clear
alias more='less'
alias less='less --use-color'
alias links='lynx -listonly -nonumbers -dump'
alias goclean='go clean -i -r -cache -modcache -testcache -fuzzcache'

alias nv='nvim'
_have vim && alias vi=vim

alias gpt='OPENAI_API_KEY=$(passage openai.com/api-key) gpt'
alias gptl='OPENAI_API_KEY=$(passage openai.com/api-key) gptl'
alias claude='ANTHROPIC_API_KEY=$(passage anthropic.com/api-key) claude'
alias cl='ANTHROPIC_API_KEY=$(passage anthropic.com/api-key) cl'
alias ytsum='OPENAI_API_KEY=$(passage openai.com/api-key) ytsum'
alias urlsum='OPENAI_API_KEY=$(passage openai.com/api-key) urlsum'
alias convertcurrency='EXCHANGERATE_API_KEY=$(passage exchangerate-api.com/api-key) convertcurrency'

# ----------------------------- functions ----------------------------

envx() {
	local envfile="${1:-"$HOME/.env"}"
	[[ ! -e $envfile ]] && echo "$envfile not found" >&2 && return 1
	while IFS= read -r line; do
		name=${line%%=*}
		value=${line#*=}
		[[ -z $name || $name =~ ^# ]] && continue
		export "$name"="$value"
	done <"$envfile"
} && export -f envx

if [[ -e $HOME/.env ]]; then
	envx "$HOME/.env"
fi

clone() {
	local repo="$1" user
	local repo="${repo#https://github.com/}"
	local repo="${repo#git@github.com:}"
	[[ $repo =~ / ]] && user="${repo%%/*}"
	[[ -z $user ]] && user="$GITUSER"
	[[ -z $user ]] && user="$USER"
	local name="${repo##*/}"
	local userd="$REPOS/github.com/$user"
	local path="$userd/$name"
	[[ -d $path ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

# fedoraupdate() {
# 	local commands=("check" "clean all" "makecache" "check-upgrade"
# 		"upgrade" "distro-sync" "autoremove" "makecache")
# 	for cmd in "${commands[@]}"; do
# 		IFS=' ' read -r -a cmd_args <<<"$cmd"
# 		sudo dnf5 -y "${cmd_args[@]}"
# 	done
# } && export -f fedoraupdate

# ----------------- external dependencies/completions ----------------

# Use bash-completion if available
if [[ -z $BASH_COMPLETION_VERSINFO ]]; then
	_source_if /usr/share/bash-completion/bash_completion
fi

owncomp=(zet keg sshkey vic pdf ws)

for cmd in "${owncomp[@]}"; do
	complete -C "$cmd" "$cmd"
done

# -------------------- personalized configurations -------------------

_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"
_source_if "$HOME/.bash_local"
