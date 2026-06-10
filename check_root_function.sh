#!/bin/bash

# This function checks whether the current user has root privileges.
# In Linux, the root user always has EUID (Effective User ID) equal to 0.
check_if_root(){
  # Compare the current user's EUID with 0
  if [[ "${EUID}" -eq "0" ]]; then
    # Return success (0) if the user is root
    return 0
  else
    # Return failure (1) if the user is not root
    return 1
  fi
}

# Call the function and evaluate its exit status
# If the function returns 0 (true), the user is root
if check_if_root; then
  echo "User is root!"
else
  # If the function returns 1 (false), the user is not root
  echo "User is not root!"
fi

#adduser darwin        
#su - darwin