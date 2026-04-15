touch prueba.txt        #creates an empty file named prueba.txt (or updates its timestamp if it already exists).
chmod 600 prueba.txt    #sets permissions so that only the owner can read and write the file (no permissions for group or others).
ls -l prueba.txt        #shows the file’s detailed information, including its current permissions.
chmod 755 prueba.txt    #changes permissions to allow the owner full access (read, write, execute) and gives read and execute permissions to group and others.
ls -l prueba.txt        #displays the updated permissions after the change.