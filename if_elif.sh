#!/bin/bash

USER_INPUT="${1}"
# Assigns the first argument passed to the script to the variable 'USER_INPUT'.

# Check if the user provided an argument

if [[ -z "${USER_INPUT}" ]]; then
# Starts an 'if' statement to check if the length of 'USER_INPUT' is zero (empty).

  echo "You must provide an argument!"
  # Prints an error message to the terminal if no argument was provided.

  exit 1
  # Exits the script with a status code of 1, indicating an error occurred.

fi
# Ends the 'if' block.

# Check if the argument is of type file or directory


if [[ -f "${USER_INPUT}" ]]; then
# Starts an 'if' statement to check if 'USER_INPUT' exists and is a regular file.

 echo "${USER_INPUT} is a file."
 # Prints a message stating it is a file if the condition above is true.

elif [[ -d "${USER_INPUT}" ]]; then
# Starts an 'else if' block to check if 'USER_INPUT' exists and is a directory.

  echo "${USER_INPUT} is a directory."
  # Prints a message stating it is a directory if the condition above is true.

else
# Starts an 'else' block, which runs if none of the previous conditions were met.

  echo "${USER_INPUT} is not a file or a directory."
  # Prints a message stating it is neither a file nor a directory.

fi
# Ends the main conditional structure.