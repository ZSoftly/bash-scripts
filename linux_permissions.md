# File Permissions in Linux / Unix:

    Linux is a clone of UNIX, the multi-user operating system which can be accessed by many users simultaneously. 
    Linux can also be used in mainframes and servers without any modifications. 
    But this raises security concerns as an unsolicited or malign user can corrupt, change or remove crucial data. 
    For effective security, Linux divides authorization into 2 levels.

       * Ownership
       * Permission
    The concept of Linux File permission and ownership is crucial in Linux.
 
Linux File Ownership:
  Every file and directory on your Unix/Linux system is assigned 3 types of owner, given below.
    * User
    * Group
    * Other

  User:
    A user is the owner of the file. By default, the person who created a file becomes its owner. Hence, a user is also sometimes called an owner.
 
  Group:
    A user- group can contain multiple users. All users belonging to a group will have the same Linux group permissions access to the file. 
    Suppose you have a project where a number of people require access to a file. 
    Instead of manually assigning permissions to each user, you could add all users to a group, 
    and assign group permission to file such that only this group members and no one else can read or modify the files.

  Others:
    Any other user who has access to a file. This person has neither created the file, nor he belongs to a usergroup who could own the file. 
    Practically, it means everybody else. Hence, when you set the permission for others, it is also referred as set permissions for the world.
    
 Linux File Permissions:
   Every file and directory in your UNIX/Linux system has following 3 permissions defined for all the 3 owners discussed above.
     * Read
     * Write
     * Execute
   Read:
     This permission give you the authority to open and read a file. 
     Read permission on a directory gives you the ability to lists its content.
   Write:
     The write permission gives you the authority to modify the contents of a file. 
     The write permission on a directory gives you the authority to add, remove and rename files stored in the directory.
     Consider a scenario where you have to write permission on file but do not have write permission on the directory where the file is stored. 
     You will be able to modify the file contents. 
     But you will not be able to rename, move or remove the file from the directory.
   Execute: 
     In Windows, an executable program usually has an extension “.exe” and which you can easily run. 
     In Unix/Linux, you cannot run a program unless the execute permission is set. 
     If the execute permission is not set, you might still be able to see/modify the program code(provided read & write permissions are set), but not run it.
 
  The characters are pretty easy to remember.
    -> r = read permission
    -> w = write permission
    -> x = execute permission
    -> – = no permission
 
Changing file/directory permissions in Linux Using ‘chmod’ command:
  We can use the ‘chmod’ command which stands for ‘change mode’. 
  Using the command, we can set permissions (read, write, execute) on a file/directory for the owner, group and the world.

  Syntax:
  
    chmod permissions filename
    
    There are 2 ways to use the command –
      1_ Absolute mode
      2_ Symbolic mode

    Absolute(Numeric) Mode in Linux:
      - In this mode, file permissions are not represented as characters but a three-digit octal number.
      - The table below gives numbers for all for permissions types.
      
      Number           Permission Type               Symbol:
      
      0                No Permission                 -
      1                Execute                       –x
      2                Write                         -w-
      3                Execute + Write               -wx
      4                Read                          r–
      5                Read + Execute                r-x
      6                Read +Write                   rw-
      7                Read + Write +Execute         rwx

    Example of chmod command in (numeric) mode
    
      chmod 764 sample
      
    In the above example, we have changed the permissions of the file ‘sample to ‘764’.
      ‘764’ absolute code says the following:
      - Owner can read, write and execute
      - Usergroup can read and write
      - World can only read
      This is shown as "-rwxrw-r–"
    This is how you can change user permissions in Linux on file by assigning an absolute number.

    Symbolic Mode in Linux:
      In the Absolute mode, you change permissions for all 3 owners. 
      In the symbolic mode, you can modify permissions of a specific owner. 
      It makes use of mathematical symbols to modify the Unix file permissions.
      
      Operator          Description
      +                 Adds a permission to a file or directory
      –                 Removes the permission
      =                 Sets the permission and overrides the permissions set earlier.
    
    The various owners are represented as –
    
      User Denotations
      u          user/owner
      g          group
      o          other
      a          all
      
    We will not be using permissions in numbers like 755 but characters like rwx. Let’s look into an example
    
    Exammple of chmod command in (symbolic) mode
    
      Setting permissions to the "Other" Users
      
        chmod o=rwx sample
        
      Adding 'execute' permission to the usergroup
      
        chmod g+x sample
        
      Removing 'read' permission for "User"
      
        chmod u-r sample

Summary:
  - Linux being a multi-user system uses permissions and ownership for security.
  - There are three user types on a Linux system viz. User, Group and Other.
  - Linux divides the file permissions into read, write and execute denoted by r,w, and x.
  - The permissions on a file can be changed by ‘chmod’ command which can be further divided into Absolute and Symbolic mode.
  - The ‘chown’ command can change the ownership of a file/directory. 
  - Use the following commands: chown user file or chown user:group file.
  - The ‘chgrp’ command can change the group ownership chrgrp group filename.
  - What does x – eXecuting a directory mean? A: Being allowed to “enter” a dir and gain possible access to sub-dirs.
