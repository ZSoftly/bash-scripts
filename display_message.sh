#!/bin/bash

# Demonstrate how read actually works

echo What pets do i like?

read pet1 pet2 pet3 pet4 pet5

echo my first pet was: $pet1
echo my second pet was: $pet2
echo my  third pet was: $pet3
echo my  fourth pet was: $pet4
echo my  fith pet was: $pet5

sleep 3

# passing and enviroment variable printing my best pet

echo what is my  best pet?

bestpet="$pet2"
echo $bestpet

sleep 3

echo "thanks for trying this good bye"


