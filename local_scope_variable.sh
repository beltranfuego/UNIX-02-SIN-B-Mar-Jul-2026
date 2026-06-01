#!/bin/bash 
PUBLISHER="No Starch Press"         #global variable works inside the entire code
print_name(){ 
    local name          #local variable only works inside the function
    name="Black Hat Bash" 
    echo "${name} by ${PUBLISHER}" 
} 
print_name          # Function call: write only the function name to execute it
echo "Variable ${name} will not be printed because it is a local variable."


