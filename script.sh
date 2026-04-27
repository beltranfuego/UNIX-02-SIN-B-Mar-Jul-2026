ls -a #Shows all files in the current directory, including hidden ones (those starting with .)
ls --all   #Does exactly the same as -a (it’s just the long version of the option)
ls -a / #Lists all files in the root directory /, including hidden system files
ls -l -a -h #Lists files with:
#-l long format (permissions, owner, size, date)
#-a include hidden files
#-h human-readable sizes (KB, MB, etc.)
ls -l -ah    #Same as above, just grouping flags
ls -lah     #Same again, all flags combined in one
mkdir -- -rf    #Creates a directory literally named -rf    -- end of options (treats whats next not as a flag)
rmdir -- -rf    #Removes a directory literally named -rf
ls --help   #Displays the help message for ls, showing its syntax, options, and basic usage.
man ls  #Opens the manual page for ls, with detailed documentation and explanations of all options.
--depth  #Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless
# --no-single-branch is given to fetch the histories near the tips of all branches. If you want to clone submodules shallowly, also
#   pass --shallow-submodules.
chmod +x script.sh  #Adds execute permission for everyone (user, group, others)
chmod u+x script.sh #Adds execute permission only for the owner (user)
chmod o+r script.sh #Adds read permission for others (everyone except owner and group)
chmod u+rw,go-rwx script.sh     #Sets permissions like this: u+rw → user: read + write go-rwx → group & others: no permissions
sudo echo "hola" > /etc/archivo_protegido   #Permission dennied because sudo only works for "echo" and /etc requires another 
#sudo permission 
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null   #Writes "hola" to a protected file using sudo, but suppresses the output in the terminal.
echo "hola" | sudo tee /etc/archivo_protegido   #Writes "hola" to a protected file using sudo and also prints it to the terminal.
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'  # Runs a shell as root with sudo and appends the text "chao" to the protected file /etc/archivo_protegido.
sudo su - #enter root
echo "$HOME"    #displays the value of the HOME environment variable
echo '$HOME'    #Print literally $HOME
umask       #umask controls default file and directory permissions by removing specific permissions automatically when they are created.
touch archivo1      #Creates an empty file called archivo1 (or updates its timestamp if it already exists).
mkdir directorio1   #Creates a directory (folder) called directorio1.
ls -l       #Lists files and directories in detailed format (permissions, owner, size, etc.).
umask 027       #Changes the permission mask so new files/directories are more restrictive.
touch archivo2
mkdir directorio2
ls -l
umask 077  #umask 077 sets a very restrictive permission mask.
sudo chown -R $(whoami) .   #Changes the ownership of all files and folders in the current directory to your user.
sudo setfacl -bnR .     #Removes all special/extended permissions (ACLs), leaving only standard permissions.
sudo useradd -m -s /usr/bin/zsh luna        #Creates a new user named luna with a home directory and Zsh as the default shell.
sudo chown luna mi_archivo  #Changes the owner of mi_archivo to the user luna.
sudo usermod -aG grupo_test $(whoami)       #Adds your current user to the group grupo_test.
newgrp grupo_test       #Switches your current session to use grupo_test as the active group.
chgrp grupo_test comun  #Changes the group ownership of comun to grupo_test.
mkdir -p proyecto/sub   # -p  creates parent directories if they don’t exist
touch proyecto/readme proyecto/sub/datos        #Creates two empty files in the specified locations.
sudo chown -R luna:grupo_test proyecto      #Changes the owner to luna and the group to grupo_test for the entire project.
#  -R → recursive (applies to everything inside)
ls -lR proyecto     #Shows all files and directories inside proyecto with full details.