id      #see the principal actual group
id -gn  #check just the name of the principal group
touch ~/test_group_heredado.txt     #create a file and see which group it has
ls -la ~/test_group_heredado.txt    #see the group it has
echo "Grupo actual: $(id -gn)"      #prints Grupo actual with the command id -gn
touch ~/antes_de_newgrp.txt         #same as before
ls -la ~/antes_de_newgrp.txt        #same as before