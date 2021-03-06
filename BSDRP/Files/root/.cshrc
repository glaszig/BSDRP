# $FreeBSD: src/etc/root/dot.cshrc,v 1.30 2007/05/29 06:37:58 dougb Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h         history 25
alias j         jobs -l
alias la        ls -aF
alias lf        ls -FA
alias ll		ls -lAF

# Some BSDRP aliases:
alias ls		ls -G
alias cli		vtysh
alias include	grep
alias reload	'system reboot'
alias halt		'system halt'
alias reboot	'system reboot'
alias wr		'config save'
alias tmux		tmux -u
alias please 'sudo \!-1'

#Ugly patch because birdc is compiled for using /usr/local/var/run
alias birdc		'birdc -s /var/run/bird.ctl'
alias birdc6	'birdc6 -s /var/run/bird6.ctl'

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)

setenv  EDITOR  vi
setenv  PAGER   less
setenv  BLOCKSIZE       K

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt='%B[%n@%m]%~%b%# '
	set filec
	set history = 1000
	set savehist = (1000 merge)
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
	# command complete with TAB	
	# lists  the  remaining 
	# choices (if any) whenever completion fails
	set autolist=ambiguous
	# recheck for new binary
	set autorehash
	# run the expand-history editor command
    #   before each completion attempt
	set autoexpand
	# Disable beep
	set nobeep
	# Error correction
	set correct = cmd
	# enables color display for the builtin ls-F and it
	# passes --color=auto to ls
	set color
	# enables color escape sequence for NLS message files	
	set colorcat
	# Prevent overwritting existing file
	# (disabled because prevent to use >> in script)
	#set noclobber
	# Display user login
	set watch=(0 any any)

	#Load command complete file
	source ~/.complete

	#Don't generate core file
	limit coredumpsize 0

endif

