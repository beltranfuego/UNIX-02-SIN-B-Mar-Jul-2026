echo '#!/bin/sh' > hola.sh  #   Creates or overwrites the file hola.sh and writes the line #!/bin/sh into it. 
#This is usually used to start a shell script with a shebang, which tells the system to run the script using sh
echo 'echo "Hola desde mi primer script"' >> hola.sh    #Appends the line echo "Hola desde mi primer script" to hola.sh. 
#This adds a command to the script so that, when it is executed, it prints Hola desde mi primer script on the screen.
cat hola.sh #displays the contents of the file hola.sh in the terminal.
./hola.sh   #runs the script file from the current directory, executing the commands written inside it.