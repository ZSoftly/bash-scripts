###  How to generate ssh keys and put the public ssh keys on a Github Account
#### First Published October 07, 2022
  
~~~
- You will like to securely authenticate to another server/computer, remote or locally via SSH
- To achieve this, you will have to do the following steps
  1. Generate the SSH Keys
  2. Print and copyyour public ssh key 
  3. Send or pass your public ssh key to the other server/computer
~~~

#### Please follow the steps below to achieve this process

  ##### To make sure you are in your home directory, run this command:
  ```
  pwd
  ```

  ##### If you are not in the home directory run this command to get to your home directory:
  ```
  cd $HOME
  ```

  ##### To check if you alreaday have ssh keys, run this command:
  ```
  ls -la /$HOME/.ssh
  ```
  ##### If the output of the command is similar to this, it means you have ssh keys
  ***
  RSA ![rsa-ssh-keys](https://user-images.githubusercontent.com/101201113/195610507-62e196bf-41f8-4e76-aac0-1ffd116c334e.png)


  ECDSA ![ecdsa-ssh-key](https://user-images.githubusercontent.com/101201113/195609492-7b94dda8-b26c-4d41-a042-7419a8553925.png)

  ***  
  ##### To generate  ssh keys, choose the appropriate encryption algorithm (RSA or ECDSA) and run the appropriate command command:
  ##### FYI
    - When you run either of these commands, you will be prompted to type some responses to the terminal 
    - Read and follow the instructions and confirm by hitting the enter key
  ***
   - RSA --> Rivest-Shamir-Adleman
  ```
  ssh-keygen -t rsa -b 4096 -C <your_email@example.com>
  ```
   - ECDSA --> Elliptic Curve Digital Signature Algorithm
  ```
  ssh-keygen -t ed25519 -C "your-email@gmail.com"
  ```
  ***
  ##### When you have finished generating your ssh keys, you will be prompted with an image like this
    - To print your public ssh keys, run the command below
    - Remember, you will print you ssh keys depending on the algorithm you choose earlier
  ***
   - RSA --> Rivest-Shamir-Adleman
  ```
  cat /$HOME/.ssh/id_rsa.pub
  ```
   - ECDSA --> Elliptic Curve Digital Signature Algorithm
  ```
  cat /$HOME/.ssh/id_ed25519.pub
  ```
  ***

##### Copy your ssh-key and go to GitHub and add your public keys:
##### On your Github, do the following
- Navigate to your profile icon on the top right
- Click on settings
- Navigate to SSH and GPG Keys (the controls on the left)
-  Click on new ssh-keys
- Give a unique name to the ssh key and paste the public key in the required location inside the key box
- Clock on save it 
- These steps are optional, but please do them if prompted
  - You maybe prompt to enter your password
  - Enter your password and take enter

##### A simple bash sccript to generate ssh-key:
```
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
```
