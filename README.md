# bash-scripts
##A documentary  on how to generate ssh keys,
   and put the public ssh keys on a Githun User Account:
	 
   To generate ssh keys go to CLI and type ls -al ~/.ssh so as to see your ssh keys:..........
	 
   If you don't have an SSH key, Type the command below, using your GitHub's account email:
	 ssh-keygen -t rsa -b 4096 -C "[your github's email]"
	 
	 After running this command, you will be offered to set the SSH key path, but we recommend you 
	 to use its default value by pressing the "Enter"  button.
	 
	 > Enter a file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
	 After that it will offer you to insert a passphrase to protect your SSH key.
	 > Enter passphrase (empty for no passphrase): [Type a passphrase]
   > Enter same passphrase again: [Type passphrase again]

# bash-scripts

 #- When we run the bash script, It will check if the user already has ssh keys 
 #- If the user has ssh keys, it should ask the user if to delete the current ssh keys 
 #- or print the public key and end the program
 #- If there are no ssh keys, it should ask the user for the email, then generate the ssh key
 #- When the script has finished running, it should display the public key to the terminal
 #- NB: The bash script should use inbuilt bash functions like `read` so that the user can give their email address at run time
 
 ****THE BRO AM STILL WORKING ON THE BASH SCRIPT PLEASE LET ME KNOW WHEN YOU HAVE SOMETHING SO WE CAN COMBINE IT TOGETHER
 ****LOL THE BASH-SCRIPTS DEY WORRY
