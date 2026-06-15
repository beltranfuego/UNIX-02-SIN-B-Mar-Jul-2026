#!/bin/bash

# Loop through every file whose name starts with "example_file"
for file in example_file*; do

    # Check if the current file is exactly "example_file1"
    if [[ "${file}" == "example_file1" ]]; then

        # Print a message indicating that the first file will be skipped
        echo "Skipping the first file"

        # Skip the rest of this iteration and continue with the next file
        continue
    fi

    # Write a random number into the current file, replacing its contents
    echo "${RANDOM}" > "${file}"

done