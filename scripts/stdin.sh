#!/bin/bash

# Asking the user to give a file name
read -p "Give the file name you want to run a search on : " file
# Display only the 3rd line of the given file
sed -n '3p' < $file