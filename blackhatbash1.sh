#!/bin/bash         
# Shebang: tells the system to run this script with Bash
#!/bin/bash -x      
set -x
#bash -r blackhatbash1.sh        #limit dangerous commands within the script
#bash -n blackhatbash1.sh        #debuggind it finds syntaxis error
#bash -x blackhatbash1.sh       #it shows every command in real time
bash --version
env
#/bin/bash
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}
ps -ef
#htop
df --human-readable
set +x
