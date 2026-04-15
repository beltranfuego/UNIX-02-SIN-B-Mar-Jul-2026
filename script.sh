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

