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


	
wc -l Gulliver.txt
split -l 2000 Gulliver.txt
mv xaa 1
mv xab 2
mv xac 3
mv xad 4
mv xae 5
mv 1 2/
mv 2 3/
mv 3 5/
mv 4 7/
mv 5 11/