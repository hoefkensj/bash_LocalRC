#!/usr/bin/env bash
# ############################################################################
# # REPO: bash_LocalRC                          AUTHOR: Hoefkens.j@gmail.com #
# # FILE: 501_history.conf                                        2023-04-27 #
# ############################################################################
#
# set -o xtrace
# set -o nounset
HISTSIZE=-1 
HISTFILESIZE="$HISTSIZE" 
HISTCONTROL=''

function bash_history() {
	local HELP
	# source bash_history_help.sh

	function history_update()	{
		builtin history -a "$HISTSYSLAST"
		builtin history -a "$HISTSYSFULL"
		builtin history -a "$HISTSESSION" 
		builtin history -c	
		cat "$HISTSYSFULL" "$HISTSYSBOOT" >> "$HISTSYSUNIQ"
		cat "$HISTSYSUNIQ" |tac|awk '!seen[$0]++' |tac > "$HISTFILE"
		cat $HISTSYSLAST |tee -a $HISTFILE |history_meta >> "$HISTSYSMETA"
		builtin history -r "$HISTFILE"
	}
	function history_meta() {
		printf '%s\t\t' "$(($( cat "$HISTSYSFULL" |wc -l )+1))"
		printf '%s\t\t' "$$" 
		printf '%s\t\t' "$( date +%s )" 
		printf '%s\t\t' "$BOOTSTAMP" 
		printf '%s\t\t' "$HOSTNAME"
		printf '%s\t\t' "$USER" 
		printf '%s\t\t' "$(tty)"
		printf '%s\t\t' "$SHELL" 
		printf '%s\t\t'	"$PS1"
		printf '%s\t\t' "$(echo $1 | md5sum)"
	}
	function history_start(){
		history_cleanup 
		[[ ! -e $HISTFILE ]] && install -m 777 /dev/null "$HISTFILE" 
		[[ ! -e $HISTSESSION ]] && install -m 777 /dev/null "$HISTSESSION" 
	}
	function history_cleanup (){
		cat "$HISTFILE" $HISTSESSION >> "$HISTDIR/$$.recovered"
		[[ -e $HISTFILE ]] && sudo trash "$HISTFILE" 
		[[ -e $HISTSESSION ]] && sudo trash "$HISTSESSION"
		[[ -e $HISTFILE ]] && sudo rm -rvf "$HISTFILE" 
		[[ -e $HISTSESSION ]] && sudo rm -rvf "$HISTSESSION"
	}
	function history_stop(){
		[[ -e $HISTFILE ]] && trash "$HISTFILE" 
		[[ -e $HISTSESSION ]] && trash "$HISTSESSION"
		history_cleanup
	}
	function history_full(){
		builtin history -c	
		cat $HISTSYSFULL > "$HISTFILE"
		builtin history -r "$HISTFILE"
	}
	
	BOOTSTAMP="$(uptime -s | tr -d '\-: ')" 
	HISTSIZE=-1 
	HISTFILESIZE="$HISTSIZE" 
	HISTCONTROL=''
	PFIX="history"
	HISTDIR="/var/cache/history/bash"
	HISTFILE="${HISTDIR}/${PFIX}.$$"
	HISTSESSION="${HISTHISTDIR}/${PFIX}.HISTSESSION.$$"
	HISTSYSBOOt="${HISTDIR}/system.boot.${BOOTSTAMP}"
	HISTSYSFULL="${HISTDIR}/system.full.${PFIX}"
	HISTSYSMETA="${HISTDIR}/system.meta.${PFIX}"
	HISTSYSLAST="${HISTDIR}/system.last.${PFIX}" #FIFO

	FNC=${FUNCNAME[0]}
	case "$1" in
		help)    batcat $HELP  &>/dev/null;;
		start)   history_start  &>/dev/null;;
		stop)    history_stop  &>/dev/null;;
		update)  history_update  &>/dev/null ;;
		meta)    shift && history_meta "$@"  &>/dev/null ;;
		full)	 history_full &>/dev/null ;;
		debug)   set -o xtrace
	esac

}	



##HISTTIMEFORMAT="%F %T "