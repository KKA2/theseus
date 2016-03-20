#!/usr/bin/env python2.7

#READ THIS: search for !!! to see all places with issues/in need of additions

#PURPOSE: this script will output the appropriate floor jpg name, as well as the ending coordinates (x and y) that solve_maze.py needs to find a path

#Status: at this time, due to lack of access to library databases (i.e. the total list of lcc call numbers/their corresponding books, this can only direct you to the right floor, and a very vague block, not even shelves at this point. need to go around the library and plot shelf locations and each shelves range

import sys

#separate call number into separate fields
fields = sys.argv[1].split()

#find appropriate floor based on subject code
# !!! going to need a function here to make sure subject is valid
subject = fields[0]

if subject == 'DG':
    floornum = 7
elif (subject >= "B" and subject <= "BR"): 
    floornum = 13
elif (subject >= "BS" and subject <= "BX"):
    floornum = 12
#!!! issue: both floor 12 and 11 have BX code, going to need another condition to differentiate
elif (subject >= "BX" and subject <= "DR"):
    floornum = 11
elif (subject >= "DS" and subject <= "F"):
    floornum = 10
elif (subject >= "JS" and subject <= "PM"):
    floornum = 8
elif (subject >= "PN" and subject <= "PQ"):
    floornum = 5
elif (subject >= "PR" and subject <= "PZ"):
    floornum = 9
else:
    floornum = 0

if floornum == 0:
    print("Error: Uncharted Book")
    sys.exit(0)
else:
    print('hesburgh%i.jpg' % floornum) 
