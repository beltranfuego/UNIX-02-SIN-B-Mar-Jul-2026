#!/bin/bash

# Define the filename that will act as a stop signal for the loop
SIGNAL_TO_STOP_FILE="stoploop"

# Start a loop that continues while the file does NOT exist
# The condition checks whether the file is missing using -f
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
  # Print a message indicating the file has not been created yet
  echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."

  # Inform the user that the script will check again after a delay
  echo "Checking again in 2 seconds..."

  # Wait for 2 seconds before checking again
  sleep 2
done

# Once the file exists, exit the loop and print a message
echo "File was found! Exiting..."