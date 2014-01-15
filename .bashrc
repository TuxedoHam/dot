# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

userflag=$(id -u);

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTTIMEFORMAT="%a %b %d - %r "
export HISTIGNORE="&:ls:exit:reset:clear:pwd:bash:cd:./configure:make:"
export HISTCONTROL=ignoredups
export HISTCONTROL=ignorespace
export HISTCONTROL=erasedups


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize
shopt -s cdspell mailwarn checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Comment in the above and uncomment this below for a color prompt
# set a "fancy" prompt by user with RED for root use with "sudo -s"
  if [ $userflag = 0 ] ; #root user
then
    PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    PS1='\[\033[1;31m\]\u@\h\[\033[0;32m\] \d \t\[\033[0;34m\]\w \[\033[5;31m\]\##\[\033[0;0m\] '
else #normal user
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='\[\033[1;34m\]\# \t - \d\[\033[2;36m\] - \u@\[\033[1;36m\]\h\[\033[0;32m\] \w \$ \[\033[0;0m\]'
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

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
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Proxy
export http_proxy="http://nikita.tux.lan:3128"

# Extracting files.
# Usage: extract archive.extension
function extract () {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar)                tar xf $1 ;;
      *.tar.bz2 | *.tbz2 )  tar xjvf $1 ;;
      *.tar.gz | *.tgz )    tar xzvf $1 ;;
      *.bz2)                bunzip2 $1 ;;
      *.rar)                unrar x $1 ;;
      *.gz)                 gunzip $1 ;;
      *.zip)                unzip $1 ;;
      *.Z)                  uncompress $1 ;;
      *.7z)                 7z x $1 ;;
      *.xz)                 unxz $1 ;;
      *)   echo ""${1}" can not be extracted()" ;;
     esac
   else
     echo ""${1}" is not a valid file!"
   fi
}

note () {
        #if file doesn't exist, create it
        [ -f $HOME/.notes ] || touch $HOME/.notes

        #no arguments, print file
        if [ $# = 0 ]
        then
                cat $HOME/.notes
        #clear file
        elif [ $1 = -c ]
        then
                > $HOME/.notes
        #add all arguments to file
        else
                echo "$@" >> $HOME/.notes
        fi
}

# Aliases
alias df="df -h"
alias ls='ls -lhA --color=auto'
alias hist='history | g $1'
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'

alias netstat="netstat --verbose --tcp --udp --programs --extend"
alias openports='ss --all --numeric --processes --ipv4 --ipv6'

# some safety aliases below
# add i for interactive if your really nervous
alias rm='rm -v'
alias rmdir='rmdir -v'
alias mv='mv -v'
alias cp='cp -v'
alias chown='chown -v'
alias chmod='chmod -v'
