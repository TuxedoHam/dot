# Report command running time if it is more than 3 seconds
REPORTTIME=3
# Keep a lot of history
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY
# Also remember command start time and duration
setopt EXTENDED_HISTORY
# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS
# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE
# Correct spelling of all arguments in the command line
setopt CORRECT_ALL
# Enable autocompletion
zstyle ':completion:*' completer _complete _correct _approximate expand _match _prefix
#zstyle ':completion:*' completer _expand _complete _match _prefix
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dale/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# To activate the menu, press Tab twice.
# For autocompletion of command line switches for aliases, add the following to: 
setopt COMPLETE_ALIASES

# To use a theme, make sure that prompt theme system is set to autoload.
# This can be done by adding these lines to:
autoload -Uz promptinit
promptinit


PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='[%F{yellow}%?%f]'

# Remembering recent directories
# Dirstack
# configured to remember the DIRSTACKSIZE last visited folders.
# This can then be used to cd them very quickly.
autoload -Uz add-zsh-hook

DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
	[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='20'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS


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

set bell-style visible

alias df="df -h"
alias ls='ls -lhA --color=auto'
alias ll='ls -alF --color=tty'
alias hist='history | g $1'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias srm='srm -rfllv'
alias which=type

alias netstat="netstat --verbose --tcp --udp --programs --extend"
alias openports='ss --all --numeric --processes --ipv4 --ipv6'

# some safety aliases below
# add i for interactive if your really nervous
alias rm='rm -v'
alias rmdir='rmdir -v'
alias mv='mv -iv'
alias cp='cp -ipv'
alias chown='chown -v'
alias chmod='chmod -v'
