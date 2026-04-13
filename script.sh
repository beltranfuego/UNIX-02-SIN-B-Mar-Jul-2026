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