#!/bin/bash

# a=0

# while [ $a -lt 10 ]
# do
#    echo $a
#    a=`expr $a + 1`
# done

while IFS= read -r line #IFS - INTERNAL FIELD SEPERATOR USED TO READ LINE BY LINE OUTPUT
do
    echo $line
done < 17-Set.sh