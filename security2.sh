id      #see the principal actual group
id -gn  #check just the name of the principal group
touch ~/test_group_heredado.txt     #create a file and see which group it has
ls -la ~/test_group_heredado.txt    #see the group it has
echo "Grupo actual: $(id -gn)"      #prints Grupo actual with the command id -gn
touch ~/antes_de_newgrp.txt         #same as before
ls -la ~/antes_de_newgrp.txt        #same as before
newgrp desarrolladores          #change to desarrolladores group
groupadd desarrolladores        #add group desarrolladores
id -gn                          #same as before
echo "(Nuevo grupo activo: $(id -gn)"            #same as before
touch ~/dentro_de_newgrp.txt        # Create a file using the current group
ls -la ~/dentro_de_newgrp.txt       # Check the file owner and group
mkdir -p ~/proyecto_dev/src         # Create a project folder with src inside
ls -la ~/                           # List home directory contents
echo "Restored group: $(id -gn)"     # Display the current group after exiting newgrp