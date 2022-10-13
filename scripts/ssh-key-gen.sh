#!/bin/bash

# Declaring a variable to store the location of the ssh keys directory
export SD="$HOME/.ssh"

# Check if the user already has ssh keys
ls -la $SD

# Creating a function to display the ssk keys
function ssh-display {
    clear; echo "Printing your ssh keys"; sleep 2;
    echo "***************************************"
    cat $SD/id_rsa.pub 2> log.txt || cat $SD/id_ed25519.pub 2> log.txt
    echo "***************************************"
    sleep 2
    echo -e "\nThank you for trying this!"
    exit 1
}
# Creating a function to take user email
function user-email {
 read -p "Enter Email: " email
}

# Creating a function to choose ssh key type and generate ssh key
function ssh-type {
  echo "Do you want RSA(r) or ECDSA(e) keys...?"
  read -p "Enter r or e as mentioned above: " option
  if [[ "$option" == "r" ]]; then
    user-email
    ssh-keygen -t rsa -b 4096 -C "$email"
  elif [[ "$option" == "e" ]]; then
    user-email
    ssh-keygen -t ed25519 -C "$email"
  else 
    echo "Invalid input"
    ssh-type
  fi
}

# If the user has ssh keys, it should ask the user if to delete the current ssh keys
# or print the public key and end the program
function ssh-generate {
  if [[ $? -eq 0 ]]; then
  read -p "Enter 1 to delete current and generate new ssh keys or 2 to print the public key : " key
      if [[ "$key" -eq 1 ]]; then
      rm -rf $SD
      ssh-type
      elif [[ "$key" -eq 2 ]]; then
        ssh-display
      else
        echo "Invalid input"
        $(ssh-generate)
      fi
  fi
}

# Calling the function to generate the ssh keys
ssh-generate

# End of Script
sleep 2
echo -e "\nThank you for trying this!"
