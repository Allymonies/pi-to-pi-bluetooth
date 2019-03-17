#!/usr/bin/env bash

SOURCE="B8:27:EB:DF:23:29"
TARGET="B8:27:EB:0F:05:79"
#Output looks like rfcomm0: B8:27:EB:DF:23:29 -> B8:27:EB:0F:05:79 channel 1 (closed/connected)
if [[ $(rfcomm show hci0 | cut -c 59-64) = "closed" ]]; then
	screen -S bt -p 0 -X stuff "^C"
	sleep 2
	screen -dmS bt rfcomm watch hci0
fi

if ! screen -ls | grep "bt"; then
	screen -dmS bt rfcomm watch hci0
fi
