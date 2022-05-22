#!/bin/bash

wget https://www.gutenberg.org/files/65473/65473-0.txt

num=2
count=0
check=0

while(( $count < 5))
do
    for((i=2; i<$num; i++))
    do
        ans=$(( num%i ))
        if [ $ans -eq 0 ]
        then
        num=$((num+1))
        check=1
        break
        fi
    done
    if [ $check -eq 0 ]
    then
    mkdir $num
    num=$((num+1))
    count=$((count+1))
    fi
    check=0
done


mv 65473-0.txt Gulliver.txt
split --number=l/5 Gulliver.txt travel
mv travelaa 2/
mv travelab 3/
mv travelac 5/
mv travelad 7/
mv travelae 11/