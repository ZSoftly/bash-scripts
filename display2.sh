#!/bin/bash

#Requesting some usefull information from the user.
read -p "What is your name? : " name
read -p "How old are you? : " age
read -p "What's your profession? : " job
read -p "Where do you work? : " work

echo -e "\n\t Mr $name is $age years old. He is an $job at $work"

echo -e "\n Welcome $name"

echo -e "\n Your present working directory is \n\t $PWD \n"