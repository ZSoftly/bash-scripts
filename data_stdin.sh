#!/bin/bash

# Create a script which will take data from STDIN and print the 3rd line only.

echo "which file do you want to print on the terminal"

read file

# Display the 3rd line only in the file
   head -n 3 $file | tail +3


