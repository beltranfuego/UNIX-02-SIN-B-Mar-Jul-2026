id      # Show current user and groups
cat /etc/passwd | head -10      # Display first 10 lines of /etc/passwd
cat /etc/group | head -10       # Display first 10 lines of /etc/group
groups $USER        # Show groups for current user
id -u                         # Show current user's UID
id -g                         # Show current user's primary GID
id -G                         # Show all group IDs for current user
cat /etc/group | grep games    # Search for the games group in /etc/group
cat /etc/gshadow               # Display protected group password information