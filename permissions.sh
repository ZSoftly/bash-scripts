#!/user/bin/bash

read -p "Enter the name of the file you want to change it's permissions : " file

chmod 700 $file

echo "$file permissions changed"
