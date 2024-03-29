# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# config
export BROWSER="firefox"
export EDITOR="code"
export VISUAL="code"

# directories
export REPOS="$HOME/repos"
export GITUSER="Loafabreadly"
export GHREPOS="$REPOS"
alias haas='cd $REPOS/haas'
alias home='cd $HOME'
alias repos='cd $REPOS'
alias dotfiles='cd $REPOS/haas/dotfiles'
alias notes='cd $REPOS/notes'

# Make MAN pages less painful to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias k='kubectl'
alias sn='sudo nano'
alias kgp='kubectl get pods'
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ls='ls --color=auto'
alias ll='ls -la'
# alias la='exa -laghm@ --all --icons --git --color=always'
alias la='ls -lathr'
alias t='tmux'
export KUBE_EDITOR=code
export TERM=xterm-256color
# finds all files recursively and sorts by last modification, ignore hidden files
alias last='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'
alias c='clear'
alias h='history'
alias tree='tree --dirsfirst -F'
alias p='pomo'
alias ebrc='nv ~/repos/haas/dotfiles/client/.bashrc'
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'
alias nv='nvim'
alias lg='lazygit'


source <(kubectl completion bash)
complete -o default -F __start_kubectl k

# Automatically ls when you CD into a directory since its what you do anyway
cd() {
	builtin cd "$@" && ll
}

# Show current network information
netinfo() {
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	echo ""
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	echo ""
	/sbin/ifconfig | awk /'inet addr/ {print $4}'

	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------------------"
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

#Prompt stuff
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
# Explicitly unset color (default anyhow). Use 1 to set it.
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"
# Explicitly unset color (default anyhow). Use 1 to set it.

#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PROMPT_COMMAND='__git_ps1 "\[\e[33m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]:\[\e[35m\]\W\[\e[0m\]" " \n$ "'

export PATH=/usr/local/bin:$HOME/repos/haas/scripts:$HOME/go/bin:$HOME/.local/bin:$HOME/.local/share/bob/v0.9.5/nvim-linux64/bin:$PATH
. "$HOME/.cargo/env"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" # Setup so Homebrew works
eval "$(oh-my-posh init bash --config /home/linuxbrew/.linuxbrew/opt/oh-my-posh/themes/emodipt-extend.omp.json)" #Setup our oh-my-posh prompt + theme



# The last step should always be to start in our home directory
cd $HOME