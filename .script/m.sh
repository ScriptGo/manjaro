#!/bin/bash 


state=$(mocp -Q '%state')
if [ $state = 'PAUSE' ]
then
	icon="⏸️"
elif [ $state = 'PLAY' ]
then
	icon="⏴"
else
	icon="⏹️"
fi

if [ $icon = "⏹️" ]
then
	media="Stopped. [--:--/--:--]"
else
	media=$(mocp -Q '%artist - %song [%ct/%tt]')
fi
echo -e "$icon $media"

exit 0
