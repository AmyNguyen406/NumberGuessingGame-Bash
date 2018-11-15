#!/bin/bash

# Amy Nguyen
# 10/28/2018
# CS 3377.0W3
# Number Guessing Game


echo "************************************"
echo ""
echo ""
echo "Welcome to the Number Guessing Game!"
echo ""
echo ""
echo "************************************"

#Initialize score counter or number of tries
tries=0

#Saving Player Names

echo "Please enter your username."

read user

echo ""
echo "Your username is now : $user."
echo ""

#Generating a number between 0 and 128
echo ""
echo "Generating a random number between 0 and 128..."
echo ""
randNum=$((0 + RANDOM % 128))

#Guessing process
echo ""
echo "Please guess a whole number between 0 and 128."
echo ""

read guess 

while [[ guess -ne randNum ]]
do

#If guess is less than random number
if [[ guess -lt randNum ]]; then
echo ""
echo "Low guess... Try again."
echo ""
fi

#If guess is greater than random number
if [[ guess -gt randNum ]]; then
echo ""
echo "High guess... Try again."
echo ""
fi

#Increment number of tries + 1
tries=$((tries+1))

#Read new attempt
read guess

done

#Game won if guess equals randNUm
if [[ guess -eq randNum ]]; then

tries=$((tries+1))

echo "************************************"
echo ""
echo "CONGRATULATIONS"
echo "You have guessed the correct number!"
echo "You win!!"
echo "Tries = $tries"
echo ""
echo "************************************"

#Printing results to file
echo "${user} ${tries}" >> scores.txt

sort -k2 -n scores.txt | head -3

fi

