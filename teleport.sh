#!/bin/bash

Add () {
	if [ $3 ]; then
		if [ ! -z "$(cat /home/$USER/.teleportzones | grep "^$2")" ]; then
			echo $2" exists"
		else
			echo "$2,$3" >> /home/$USER/.teleportzones
		fi
	else
		if [ ! -z "$(cat /home/$USER/.teleportzones | grep "^$2")" ]; then
			echo $2" exists"
		else
			echo "$2,$(pwd)" >> /home/$USER/.teleportzones
		fi
	fi
}

Remove () { 
	if [ ! -z "$(cat /home/$USER/.teleportzones | grep "^$2",)" ]; then
		sed -i "/^$2/d" /home/$USER/.teleportzones
	else
		echo $2" doesn't exist"
	fi
}

Teleport () {
	if [ ! -z "$(cat /home/$USER/.teleportzones | grep "^$1",)" ]; then
		bleh="$(cat /home/$USER/.teleportzones | grep "^$1", | sed "s/$1,//")"
		cd $bleh
	else
		echo $1" doesn't exist"
	fi
}

List () {
	cat /home/$USER/.teleportzones | column -t -s ","
}


# Actual Worflow
##################

if [ ! -f ~/.teleportzones ]; then
	touch /home/$USER/.teleportzones
fi
if [ $2 ]; then
	if [ $1 = 'r' ]; then 
		Remove $1 $2 $3
		# Remove
	elif [ $1 = 'a' ]; then
		Add $1 $2 $3
	else 
		echo "Either use 'add' or 'remove' or just teleport!"
	fi
elif [ $1 = 'l' ]; then
		List
else
	Teleport $1
fi

