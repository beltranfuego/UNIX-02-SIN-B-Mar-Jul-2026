#!/bin/bash

# Assign arguments to variables
FIRST_NAME="$1"
LAST_NAME="$2"

# Create output.txt and write the date
date +"%d-%m-%Y" > output.txt

# Write the full name to output.txt
echo "$FIRST_NAME $LAST_NAME" >> output.txt

# Create a backup
cp output.txt backup.txt

# Print the contents of output.txt
cat output.txt
