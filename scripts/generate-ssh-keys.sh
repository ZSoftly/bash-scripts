#!/bin/bash

echo ""
echo -e "This script will generate or print your existing ssh key\n"
sleep 1

# creating variables for  public ssh keys
# we use the export command so the variables are available to all parent child processes 
export rsa="$HOME/.ssh/id_rsa.pub"
export id_ed="$HOME/.ssh/id_ed25519.pub"

# creating a function to hold file variables
function test_variable {
  echo -e "\n rsa key is: $rsa\n"
  echo -e "\n id_ed key is: $id_ed\n"
}

# function to generate the ssh keys with case statements
ssh_generator() {
  read -p "Enter r for rsa or i for id_ed or q to quit: " key_type
  case $key_type in 
    i|I|ed25519)
      echo ""
      echo -e "\n Generating new ssh keys\n"
      ssh-keygen -t ed25519 -C "$email"
      echo ""
      echo -e "Here are your keys\n"
     cat $id_ed
      ;;
      r|R|rsa)
      echo ""
      echo -e "\n Generating new ssh keys\n"
      ssh-keygen -t ed25519 -C "$email"
      echo ""
      echo -e "Here are your keys\n"
      cat $id_ed
      ;;
    q|Q|quit)
      echo ""
      echo -e "\n You habe chosen to end the program, good bye"
      exit 1
      ;;
    *)
      echo -e "\t\nInvalid input \n"
      ssh_generator
      ;;
  esac
}

## function to generate the ssh keys
## Generating ssh keys with if else and nested if else statements
ssh_generator() {
  read -p "Enter r for rsa or i for id_ed or q to quit: " key_type
  if [[ "$key_type" == "r" ]]; then
    echo -e "\n Generating new ssh keys\n"
    ssh-keygen -t rsa -b 4096 -C "$email"
    echo ""
    echo -e "Here are your keys\n"
    cat $rsa
  elif [[ "$key_type" == "i" || "$key_type" == "I" || "$key_type" == "ed25519 " ]]; then
    echo ""
    echo -e "\n Generating new ssh keys\n"
    ssh-keygen -t ed25519 -C "$email"
    echo ""
    echo -e "Here are your keys\n"
    cat $id_ed
  elif [[ "$key_type" == "q" ]]; then
    echo ""
    echo -e "\n You habe chosen to end the program, good bye"
    exit 1
  else 
    echo ""
    ssh_generator
  fi
}

## Entering the program
## Printing the ssh keys || Generating the ssh keys
if [[ -f "$rsa" ]] || [[ -f "$id_ed" ]]
then
  echo -e "There are keys present\n"
  echo -e "Your public ssh keys are\n"
  cat $rsa 2> /dev/null || cat $id_ed
  sleep 2
else
  read -p "Enter your email: " email
  ssh_generator
fi