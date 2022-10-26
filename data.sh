#!/bin/bash

# Display a message to the user
echo "Name your 5 favorite sports? : "
# request input from user
read -a sports
# Display the 3rd line of the data input by user
echo "${sports[2]}"