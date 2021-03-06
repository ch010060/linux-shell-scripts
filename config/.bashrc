# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
/usr/bin/landscape-user

findfile() {
    find . -iname "$1" -type f | head | GREP_COLORS="sl=0;33;49:ms=1;34;49" grep --color=always '^\|[^/]*$'
}

finddir() {
    find . -iname "$1" -type d | head | GREP_COLORS="sl=0;33;49:ms=1;34;49" grep --color=always '^\|[^/]*$'
}

mvc() {
	mv "$1" ~/downloads/completed
}

#env setting
export LC_ALL="en_US.UTF-8"
export TZ="/usr/share/zoneinfo/Asia/Taipei"
#path
export PATH=~/bin:~/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin
export PATH="~/downloads/script/:$PATH"
export PATH="~/downloads/script/alias/:$PATH"
export PATH="~/downloads/script/run_daemon/:$PATH"
export PATH="~/downloads/tool/:$PATH"
#color
export Color_Off='\033[0m'       # Text Reset
export Black='\033[0;30m'        # Black
export Red='\033[0;31m'          # Red
export Green='\033[0;32m'        # Green
export Yellow='\033[0;33m'       # Yellow
export Blue='\033[0;34m'         # Blue
export Purple='\033[0;35m'       # Purple
export Cyan='\033[0;36m'         # Cyan
export White='\033[0;37m'        # White

#seedhost command
alias rtorrent_status='sh /usr/bin/bash_script 3'
alias rtorrent_restart='sh /usr/bin/bash_script 1'
alias deluge_status='sh /usr/bin/bash_script 4'
alias deluge_restart='sh /usr/bin/bash_script 2'
alias hddusage='sh /usr/bin/bash_script 5'
alias commands='cat /usr/bin/landscape-info'
#bashrc
alias reload='source ~/.bashrc'
#vim
alias vim='vi'
#cd
alias cds='cd ~/downloads/script/'
alias cdl='cd ~/downloads/log/'
alias cdd='cd ~/downloads/'
alias cdc='cd ~/downloads/completed'
alias cdh='cd ~/downloads/hath'
alias cdaria='cd ~/downloads/aria'
alias cdbowen='cd ~/downloads/bowen'
alias cdu2='cd ~/downloads/u2'
alias cdyd='cd ~/downloads/youtubedl'
alias cdtool='cd ~/downloads/tool/'
alias cdgd='cd ~/downloads/gd/'
alias cdtemp='cd ~/downloads/temp/'
alias cddl='cd ~/downloads/downloading/'
alias cdrun='cd ~/downloads/script/run_daemon'
alias rmdirs='rclone rmdirs --leave-root'
alias ll='ls -alh'
alias df='df -h'
alias timestamp='date +%Y%m%d%H%M%S'
alias rl='readlink -f'
alias showp='stat -c "%a %n"'alias aria2='aria2c'
alias yd='youtube-dl'
alias cls='clear'
alias cda='cd ~/downloads/script/alias/'
alias chx='chmod +x *'
alias cdbackup='cd ~/downloads/backup'
alias rund='run-parts ~/downloads/script/run_daemon/'
HISTTIMEFORMAT="%T "
HISTTIMEFORMAT="%F %T "
