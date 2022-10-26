#!/bin/bash

# Filter the output of the "ls -l" command and print only the permissions, owner and name columns of the files and folders in the PWD
ls -l | awk '{print $1,$3,$9}'