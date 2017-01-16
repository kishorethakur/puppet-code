tandardized Mcdata File: /root/.kshrc                                     #
#                                                                             #
#  Edit only on the Admin Master (Currently frodo)                            #
#  1. vi /root/.kshrc                                                         #
#  2. Sdist FILES_GLOBAL                                                      #
#                                                                             #
###############################################################################

set -o vi                 # Set command line editing #

alias  bdf='df -k'
alias    c='clear'
alias  cls='clear'
alias  spy='ncftpd_spy'
alias purg='ssh purgatory'
alias  ssl='ssh ssl'
alias   Lp='lp -d172.16.1.10 -od -o2 '
alias   lp="lp -o nobanner"
alias nuke="/usr/bin/rm -r"
alias tp="unix2dos $1 | lp -o nobanner"
alias tree="su - tree"
alias ypa="ypcat -k auto.home | grep "
alias ypp="ypcat -k passwd | grep "
alias ypg="ypcat -k group    | grep "
alias ypn="ypcat -k netgroup | grep "
alias NB='/usr/openv/netbackup/bin/jnbSA &'
alias jnbSA='/usr/openv/netbackup/bin/jnbSA &'
alias Cluster='system-config-cluster &'
alias Mail='cd /root/nobody; mail -f /var/mail/nobody'
alias Pso='ps -o pid,ppid,user,pcpu,pmem,vsz,rss,time,stime,zone,comm,args |head -1;ps -o pid,ppid,user,pcpu,pmem,vsz,rss,time,stime,zone,comm,args -u oracle -y |grep -v "COMMAND$" |sort -nrk5 |head -20'
alias Vncserver='vncserver -geometry 1280x1024'

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
		alias Remount="mount -oremount "
		KSHLOGIN="ksh -l"
	;;
    SunOS)
		alias   l.='ls -d'
		alias   la='ls -aF'
		alias   ll='ls -al'
		alias  lld='ls -al'
		alias  lld='ls -ald'
		alias  llm='ls -al | more'
		alias a2ps="enscript -hr2b'%W|\$N|Page \$% of \$='"
		alias enscript="enscript -h"
		# Jumpstart aliases    #
		alias   jstart='cd /export/install/sol8/jstart'
		alias  scripts='cd /export/install/sol8/jstart/scripts/all'
		alias packages='cd /export/install/sol8/jstart/pkgs/all'
		alias  patches='cd /export/install/sol8/jstart/patches'
		alias sysfiles='cd /export/install/sol8/jstart/sysfiles/all'
		alias  product='cd /export/install/sol8/Solaris_8/Product'
		alias sysidcfgdmfe='cd /export/install/sol8/jstart/sysidcfg-dir/dmfe0/'
		alias  sysidcfghme='cd /export/install/sol8/jstart/sysidcfg-dir/hme0/'
		alias  sysidcfgqfe='cd /export/install/sol8/jstart/sysidcfg-dir/qfe0/'
		KSHLOGIN="ksh"
	;;
	*)
esac

if [ -x /usr/bin/tput ]; then
  if [ "x`tput kbs`" != "x" ]; then # We can't do this with "dumb" terminal
	stty erase `tput kbs`
  elif [ -x /usr/bin/wc ]; then
	if [ "`tput kbs|wc -c `" -gt 0 ]; then # We can't do this with "dumb" terminal
	  stty erase `tput kbs`
	fi
  fi
fi

alias cd=CWD
CWD () {
	if [ $# -ne 0 ]; then
		'cd' "$@"
	else
		'cd'
	fi
	NAME="${USER}@$(uname -n):${PWD}"

	case $TERM in
	xterm*)
		# reset name of xterm title bar & icon to $NAME
		print "\033]0;${NAME}\007\c"  # set title bar & icon
		stty erase ^?
		;;
	screen)
		# reset name of screen title bar & icon to $NAME
		print "\033_;${NAME}\007\\\c"  # set title bar & icon
		;;
	vt*)
		stty erase ^?
		;;
	*)
		:
		;;
	esac
	PS1="
$NAME 
 => "
}
CWD .
	
if [ "$SHELL" = "/bin/ksh" -o "$SHELL" = "/usr/bin/ksh" ];then
	alias Wmb='. /root/.wmb/.kshrc'
else
	alias Wmb="export SHELL=/bin/ksh;exec $KSHLOGIN"
fi

#if [ "x$SHLVL" != "x1" ]; then # We're not a login shell
#	for i in /etc/profile.d/*.sh; do
#		if [ -r "$i" ]; then
#		. $i
#		fi
#	done
#fi

