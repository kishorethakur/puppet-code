# .bashrc

set -o vi

# User specific aliases and functions

test -f /root/.history && rm /root/.history
test -d /root/.history || mkdir /root/.history
find /root/.history -type f -mtime +7 -prune -exec rm -f {} \;
HISTFILE=/root/.history/history.$$
HISTSIZE=1000

case `uname -s` in
	HP-UX)
		alias   l.='ls -d'
		alias   la='ls -aF'
		alias   ll='ls -al'
		alias  lla='ls -al'
		alias  lld='ls -adl'
		alias  llm='ls -al | more'
	;;
	Linux)
		alias  l.='ls -d --color=tty'
		alias  la='ls -aF --color=tty'
		alias  ll='ls -l --color=tty'
		alias lla='ls -al --color=tty'
		alias lld='ls -adl --color=tty'
		alias llm='ls -al --color=tty| more'
		alias mailx='mail'
		alias Remount='mount -oremount '
		KSHLOGIN="ksh -l"
	;;
	SunOS)
		alias   l.='ls -d'
		alias   la='ls -aF'
		alias   ll='ls -al'
		alias  lld='ls -al'
		alias  lld='ls -ald'
		alias  llm='ls -al | more'
		KSHLOGIN="ksh"
		;;
	*)
esac

alias Wmb="export SHELL=/bin/ksh;exec $KSHLOGIN"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\h:\w \u # "


