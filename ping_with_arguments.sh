#!/bin/bash
# This script will ping any address provided as an argument.
SCRIPT_NAME="${0}"
TARGET="${1}"
echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping -c 3 "${TARGET}"           #-c means the number of pings i want
echo "The arguments are: $@"
echo "The total number of arguments is: $#"
for args in "$@"; do
 echo "${args}"
done