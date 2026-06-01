shebang    #!/bin/bash
#!/bin/bash -x      It shows every single command in real time
bash -r blackhatbash1.sh        #limit dangerous commands within the script
bash --version
env
/bin/bash
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}
ps -ef
htop
df --human-readable