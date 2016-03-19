#!/bin/bash
#converts inputting Library of Congress classification to a location the shelf
#Authors: Kat Herring, Kate Barlock, Ann Keenan
#Date: 3/19/16

while getopts h name
do
	case $name in 	
		h) echo "usage: convertToPix.sh 'LCC call number' 
Converts book number to its appropriate pixel coordinates on the correct floor map

  -h : details usage";;	
		*) echo "Invalid arg" 
			exit 1;;
			
	esac
done

shift $(($OPTIND -1))

i=0
for section in $1
	classific[i]="$section"
	i=$((i + 1))
done

#NOTE: $0 gives subject (ex. PS); $1 is first set of numbers
echo ${classific[0]}

#find appropriate floor number based on subject code
if [ ${classific[0]} = "DG" ]; then
	floornum=7
else if [[ ${classific[0]} <= "BR" -a  "B" <= ${classific[0]} ]]; then #need to check that is above B though
	floornum=13
else if [[ ${classific[0]} <= "BX" -a  "BS" <= ${classific[0]} ]]; then
	floornum=12
else if [[ ${classific[0]} <= "DR" -a  "BX" <= ${classific[0]} ]]; then
	floornum=11
else if [[ ${classific[0]} <= "F" -a  "DS" <= ${classific[0]} ]]; then
	floornum=10
else if [[ ${classific[0]} <= "PM" -a  "JS" <= ${classific[0]} ]]; then
	floornum=8
else if [[ ${classific[0]} <= "PQ" -a  "PN" <= ${classific[0]} ]]; then
	floornum=5
else if [[ ${classific[0]} <= "PZ" -a  "PR" <= ${classific[0]} ]]; then
	floornum=9
else 
	floornum=0
fi

#catch uncharted books and exit the program
if [ $floornum -eq 0 ]; then
	echo "Error: Uncharted Book"
	exit 1
fi

#set floor image name (for passing to solve.py)
floorfile="hesburgh"$floornum"key.jpg"
imagepath="webdesign/img/floors/"$floorfile

#find specific coordinates for 10th floor:
if [ $floornum -eq 10 ]; then
	#check the subject code to narrow down the shelves
	#split into D, E, F groups
	#if [ ${classific[0]} = "DS" ]; then
	#else if [ ${classific[0]} = "DT" ]; then
	#else if [ ${classific[0]} = "DU" ]; then 
	
	if [ ${classific[0]} = "E" ]; then
		if [ ${classific[1]} -lt 476.66 -a ${classific[1]} -gt 185.86 ]; then
			end_X=97
			end_Y=191
		fi
	else if [ ${classific[0]} = "F" ]; then
		if [ ${classific[1]} -lt 744 -a ${classific[1]} -gt 559.9 ]; then
			end_X=277
			end_Y=302
		fi
	fi
fi

#pass everything to solve.py
solve.py $imagepath $end_X $end_Y