#!/bin/bash
# Specifies that the script should be executed using the Bash shell.

# Verify that exactly 2 arguments were provided
if [[ $# -ne 2 ]]; then
    # Check whether the number of arguments is not equal to 2.

    echo "Usage: $0 <name> <domain>"
    # Display the correct usage of the script.

    exit 1
    # Exit the script with status code 1 to indicate an error.
fi

NAME="$1"
# Store the first command-line argument in the NAME variable.

DOMAIN="$2"
# Store the second command-line argument in the DOMAIN variable.

# Ping the domain (send 1 packet)
if ping -c 1 "$DOMAIN" &>/dev/null; then
    # Send one ping request to the domain and suppress all output.
    # The condition is true if the ping succeeds.

    RESULT="success"
    # Save "success" if the ping was successful.
else
    RESULT="failure"
    # Save "failure" if the ping was unsuccessful.
fi

# Current date and time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
# Store the current date and time in the TIMESTAMP variable.

# Write to CSV file
echo "$NAME,$DOMAIN,$RESULT,$TIMESTAMP" > results.csv
# Write the collected information to the CSV file.
# The ">" operator overwrites the file if it already exists.

echo "Result saved to results.csv"
# Display a confirmation message to the user.