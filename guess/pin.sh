#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

pin=$(printf "%04d" `bc <<< $RANDOM%10000`)

#echo $pin

correct=0

while [ $correct -ne 1 ]
do
	printf "1 2 3\n4 5 6\n7 8 9\n  0\n"
	read -p "enter pin: " guess

	if [ $guess -eq 100000 ]
	then
		echo $pin
		exit 1
	fi
	
	if [ $guess -eq $pin ]
	then
		correct=1
	else
		echo -e "${RED}incorrect${NC}"
	fi
done

echo -e "${GREEN}correct!${NC}"

