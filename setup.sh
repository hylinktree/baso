#!/bin/bash
host=localhost:8603
apihost=localhost:8668
url=${host}/backup
fname=.defaults
vdate=null
sta=L25PSD
machid=K01/03
dur=7
#  curl "localhost:8603/findpo?sta=L13&partno=4.100.009.810"

for ((;$#>0;)); do
	arg=$1
	shift
	if [[ $arg == --restore ]]; then
		curl -s --data @${fname} -H 'Content-Type: application/json' $url
	fi
	if [[ $arg == --backup ]]; then
		curl -s $url -o $fname
	fi
	if [[ $arg == --updatedb ]]; then
		curl -s ${apihost}/bapi/updatedb
	fi
	if [[ $arg == --wipe-all-data ]]; then
		curl -s ${host}/wipeall
	fi
	if [[ $arg == --reload ]]; then
		curl -s ${host}/reload
	fi
	if [[ $arg == --vdate ]]; then
		vdate=$1
		shift
	fi
	if [[ $arg == --duration ]]; then
		dur=$1
		shift
	fi
	if [[ $arg == --sta ]]; then
		sta=$1
		shift
	fi
	if [[ $arg == --machid ]]; then
		machid=$1
		shift
	fi
	if [[ $arg == --prune ]]; then
		echo curl "${host}/prune?sta=${sta}&vdate=${vdate}"
		curl -s "${host}/prune?sta=${sta}&vdate=${vdate}"
		echo -e 
	fi
	if [[ $arg == --schedule ]]; then
		echo curl "${host}/reschedule?sta=${sta}&vdate=${vdate}&duration=${dur}"
		curl -s "${host}/reschedule?sta=${sta}&vdate=${vdate}&duration=${dur}"
		echo -e 
	fi
	if [[ $arg == --mdump ]]; then
		curl -s "${host}/dbg/mdump?sta=${sta}&machid=${machid}"
		echo .
	fi
done

