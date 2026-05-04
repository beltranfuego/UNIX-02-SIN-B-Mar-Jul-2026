id      # Show current user and groups
cat /etc/passwd | head -10      # Display first 10 lines of /etc/passwd
cat /etc/group | head -10       # Display first 10 lines of /etc/group
groups $USER        # Show groups for current user