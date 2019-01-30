#!/bin/bash

## This program will take a homework number as an argument and then will:
## (1) run the '~abrick/tally' command;
## (1.5) enter '231' at the prompt
## (2) pull out each string in the output of (1) that is a file path;
## (3) truncate a new file called 'hw_review_[homework number provided as argument]';
## (4) cat each filepath's file contents into the file created in (3);
## (5) run each program using Python3
## (6) display the output of the file when run

hwnum=$1 ## takes homework number as argument

printf "231" | ~abrick/tally > capture.txt ## runs the command and enters 231 at prompt

grep "/user" capture.txt > grepper.txt ## grab all lines with '/user' and put them in a neat pile

rm capture.txt ## clean up on aisle InefficientProgramming

: > hw_review_${hwnum}.pr ## truncate a new file with homework number in file name

while read -r LINE; do ## read each line in the file and run a command
	 printf "\n***$LINE***\n\n" >> hw_review_${hwnum}.pr ## file name - tried to make it easier to see but it is not great
	 cat "$LINE" >> hw_review_${hwnum}.pr ## file contents
	 # printf "\n***OUTPUT***\n\n" >> hw_review_${hwnum}.pr
	 # echo "$(python3 $LINE)" >> hw_review_${hwnum}.pr
done < grepper.txt ## perform the while loop operation on tht grepper.txt file

rm grepper.txt ## more clean up and another sign of a needed refactoring
