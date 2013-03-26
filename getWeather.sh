#!/bin/bash

if [ x$1 = x"--help" ] ; 
then
	echo "This script shows Minsk weather. You're able to config this script by config.ini file - just write a number there (in seconds)"
	exit
fi

if ping -c1 weather.yahooapis.com >/dev/null;
then
	echo "Connection established!";
else
	echo "No connection!";
	exit 1;
fi

TIME_TO_SLEEP=`cat config.ini`

while true; do 
	lwp-request "weather.yahooapis.com/forecastrss?w=834463&u=c" | grep -A1 "Current" | tail -n 1 | cut -d '<' -f1;
	sleep $TIME_TO_SLEEP; 
done;
