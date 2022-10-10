## October, 07/2022
 
##  How to generate ssh keys and put the public ssh keys on a Github User Account
 
Make sure you are in your home directory, run this command:
    pwd

If you are not inn the home directory use this command to get to your home directory:
    cd $HOME

Check if you  alreaday have ssh keys: 
    ls -al ~/.ssh
  
To generate your ssh-keys run this command:
    ssh-keygen -t rsa -b 4096 -C <your_email@example.com>

print your public ssh-keys:
    cat ~/.ssh/id_rsa.pub

Copy your ssh-key and go to GitHub and add your public keys:
# On your Github, do the following
  ** navigate to your profile
  ** click on settings
  ** navigate to ssh-keys
  ** take new ssh-keys
  ** give a unique name to the ssh key and paste the public key in the required folder.
  ** save it, 
      You maybe prompt to enter your password
      Put in your password and take enter.

A simple bash sccript to generate ssh-key:
```
#!/bin/bash

# Check if the user already has ssh keys
   ls -al ~/.ssh

# If the user has ssh keys, it should ask the user if to delete the current ssh keys
# or print the public key and end the program

if [[ $? -eq 0]]
then
        read -p "Enter 1 to delete current ssh keys or 2 to print the public key : " key
                if [[ $key -eq 1 ]]
                then
                        rm -rf ~/.ssh
                else [[ $key -eq 2 ]]
                        cat ~/.ssh/id_rsa.pub || cat /$HOME/.ssh/id_ed25519.pub
                        break
                fi
else
        read -p "Enter Email: " email
        ssh-keygen -t rsa -b 4096 -C "$email"
        cat ~/.ssh/id_rsa.pub || cat /$HOME/.ssh/id_ed25519.pub
fi
```
