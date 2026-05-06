id      # Show current user and groups
cat /etc/passwd | head -10      # Display first 10 lines of /etc/passwd
cat /etc/group | head -10       # Display first 10 lines of /etc/group
groups $USER        # Show groups for current user
id -u                         # Show current user's UID
id -g                         # Show current user's primary GID
id -G                         # Show all group IDs for current user
cat /etc/group | grep games    # Search for the games group in /etc/group
cat /etc/gshadow               # Display protected group password information
# Create a new group called desarrolladores
groupadd desarrolladores

# Create a new group called operaciones with GID 2000
groupadd -g 2000 operaciones

# Create a new system group called servicios_web
groupadd --system servicios_web

# Search for the groups desarrolladores, operaciones, or servicios_web in /etc/group using extended regex
grep -E "desarrolladores|operaciones|servicios_web" /etc/group

# Search for the groups desarrolladores, operaciones, or servicios_web in /etc/group using basic regex
grep "desarrolladores\|operaciones\|servicios_web" /etc/group           # \| means take not as a pipeline but as an or gate
                                                                        # \ means "caracter de escape"

groupadd --help         # We see the main options

# Check the GID ranges configured in the system
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
# System groups usually have a GID lower than the minimum regular user GID.
# On Ubuntu/Debian, it is typically:
# SYS_GID_MIN = 100
# SYS_GID_MAX = 999
# GID_MIN     = 1000
# GID_MAX     = 60000
