#!/bin/bash

# This script adds spacers to the macOS dock

#Created on 19-05-2017

#Author = Valtteri Koskivuori (@vkoskiv)

#Version 1.0

#START

if [ "$#" -lt 1 ]
then
	(>&2 echo "Please enter the number of spacers you'd like.")
	exit 1;
fi
count="$1"

if [ $count -gt 20 ]
then
	printf "About to add $count spacers. You probably don't want to add that many.\n"
	read -p "Are you sure you want to add $count? (y/n)" -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		echo "Abort!"
		exit 1
	fi
fi

echo "Adding $count spacers..."
i=0
while [ $i -lt $count ];
do
	defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
	let i=i+1
	sleep 0.3
done
killall Dock
echo "$count spacers added, enjoy! Just drag out to remove."
exit 0
