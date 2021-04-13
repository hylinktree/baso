#!/bin/bash
host=140.92.24.47:8603
apihost=localhost:8668
wait=

echo "Baso Sfc Test Report"
echo Date: `date`
echo -e

pause() {
	# local wait=600
	if [[ x$wait == x ]]; then
		return
	fi
	read -p "Hit Keyboard or wait $wait seconds ... " -t $wait -n 1 ch
}

run() {
	partno=$1
	sta=$2
	echo test $partno on $sta
	curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
	echo -e 
	pause
}

for ((;$#>0;)); do
	arg=$1
	shift
	if [[ $arg == --help ]]; then
		echo "$0 [--wait 30] --test"
	fi
	if [[ $arg == --wait ]]; then
		wait=$1
		shift
	fi
	if [[ $arg == --test ]]; then
		run 4.100.009.604 L22LSD
		run 4.100.009.604 L22PSD

		partno=4.100.009.216
		sta=L13LSD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause
		sta=L13PSD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		partno=4.100.009.598
		sta=L11S
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		sta=L11D
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		sta=L11SD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		partno=4.100.009.600
		sta=L11S
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		sta=L11D
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause
		sta=L11SD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		partno=4.100.007.408
		sta=L11S
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause
		sta=L11D
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause
		sta=L11SD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		partno=4.100.009.594
		sta=L14PSD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		sta=L14LSD
		partno=4.100.009.594
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		# test L25LST on S6 machines
		partno=4.100.009.606
		sta=L25LSD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause
		sta=L25PSD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause

		partno=4.100.009.610
		sta=L25LSD
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause
		# test L25LST on KS60 machines
		sta=L25PSD
		partno=4.100.009.610
		echo test $partno on $sta
		curl -s "${host}/sfcdata?operid=${sta}&partno=${partno}" | jq .data
		echo -e 
		pause


	fi
done

