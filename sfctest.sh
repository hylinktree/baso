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
		echo "$0 [--wait seconds] --test"
	fi
	if [[ $arg == --wait ]]; then
		wait=$1
		shift
	fi
	if [[ $arg == --test ]]; then
		# run 4.100.006.884 L22LSD
		# run 4.100.007.408 L22PSD

		run 4.100.009.598 L11S
		run 4.100.009.598 L11D
		run 4.100.009.598 L11SD

		# run 4.100.009.600 L11S
		# run 4.100.009.600 L11D
		# run 4.100.009.600 L11SD

		run 4.100.009.216 L13LSD
		run 4.100.009.216 L13PSD

		run 4.100.009.594 L14LSD
		run 4.100.009.594 L14PSD

		run 4.100.009.606 L25LSD
		run 4.100.009.606 L25PSD

		run 4.100.009.610 L25LSD
		run 4.100.009.610 L25PSD


	fi
done

