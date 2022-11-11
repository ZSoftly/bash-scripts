#!/bin/bash

# Rearange the output of ls -l and print file names, size and owner
 ls -l | awk '{print $9,$5,$3}'

 

  

