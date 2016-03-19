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
	array[i]="$section"
	i=$((i + 1))
done

#NOTE: $0 gives subject (ex. PS); $1 is first set of numbers
echo ${array[0]}

#find appropriate floor and corresponding image

#hard coded ranges here (eg hesburgh[10

#each corresponding range has 
