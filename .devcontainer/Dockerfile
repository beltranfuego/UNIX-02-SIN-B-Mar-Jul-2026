# Docker uses this file as a build recipe to create a container image.
# An image is a reusable template that contains an operating system,
# installed software, configuration files, and default settings.
#
# Containers are created from images. Multiple containers can be created
# from the same image while keeping the original image unchanged.
#
# Docker processes instructions from top to bottom. Each instruction creates
# a layer that can be cached and reused in future builds. Keeping stable
# instructions near the top improves build performance because unchanged
# layers do not need to be rebuilt. (Black Hat Bash Ch.3)


# Use Kali Linux Rolling as the base image for the course environment.
# A base image provides the initial filesystem and operating system on
# which all later instructions are built.
#
# Kali Linux is commonly used for networking, system administration,
# scripting, and security-related exercises, making it suitable for
# the course environment. (Black Hat Bash Ch.3)
FROM kalilinux/kali-rolling:latest


# Environment variables provide configuration values that can be accessed
# by programs running inside the container. They are commonly used to
# control software behavior without modifying source code. (Black Hat Bash Ch.1)
#
# DEBIAN_FRONTEND=noninteractive prevents package installers from waiting
# for user input during automated builds.
#
# LANG defines the default language and character encoding used by programs.
#
# LC_ALL overrides locale settings and ensures a consistent UTF-8 environment.
#
# TERM=xterm-256color informs terminal applications that 256-color support
# is available.
#
# Backslashes "\" are used to continue a command across multiple lines for
# better readability.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# Some packages request configuration choices during installation.
# debconf-set-selections allows predefined answers to be supplied before
# installation starts, preventing the build from stopping for input.
#
# The pipe operator (|) sends the output of echo directly into
# debconf-set-selections. (Black Hat Bash Ch.1)
#
# Wireshark normally asks whether packet capture privileges should be
# granted to non-root users. The answer is configured in advance here.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# RUN executes commands while the image is being built.
#
# apt-get update downloads the latest package index information from
# configured repositories.
#
# apt-get install downloads and installs the requested software packages.
#
# The -y option automatically answers yes to installation prompts.
#
# --no-install-recommends installs only required dependencies and avoids
# optional packages that would increase image size unnecessarily.
#
# Commands are chained with && so that each command executes only if the
# previous one succeeds. This helps detect build errors early.
# (Black Hat Bash Ch.1)
#
# Package names are split across multiple lines using backslashes to
# improve readability.
#
# Using one large RUN instruction reduces the number of Docker layers,
# resulting in a smaller and more efficient image. (Black Hat Bash Ch.3)
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Text editors and command interpreters ===
    # Neovim and Vim are terminal-based text editors commonly used in Linux.
    # Bash is the shell used throughout the course for scripting and command
    # execution. bash-completion provides automatic command and filename
    # completion to improve productivity.
    neovim \
    vim \
    bash \
    bash-completion \
    \
    # === Text processing and scripting tools ===
    # These tools are heavily used in shell scripting and automation.
    # grep searches for patterns in text files.
    # sed performs stream editing and text transformations.
    # gawk processes structured text and generates reports.
    # (Black Hat Bash Ch.2)
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Core UNIX utilities ===
    # coreutils provides essential commands such as ls, cat, sort, head,
    # tail, cut and tr.
    # findutils includes tools such as find and xargs.
    # procps provides process management commands including ps, top and kill.
    # less allows efficient viewing of large files.
    # tree displays directory structures in a hierarchical format.
    # jq processes and filters JSON data from the command line.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Manual page documentation ===
    # man-db and the manual page packages provide built-in documentation
    # for commands and utilities. Accessing documentation with "man" is
    # an important Unix skill.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Download and repository tools ===
    # curl and wget retrieve content from remote servers.
    # git provides distributed version control.
    # git-lfs enables support for large files stored outside the normal
    # Git object database.
    # ca-certificates provides trusted certificates for HTTPS connections.
    # locales adds language and localization support.
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Shell script analysis ===
    # shellcheck analyzes shell scripts and detects common mistakes,
    # portability issues and unsafe scripting practices.
    shellcheck \
    \
    # === Network reconnaissance ===
    # nmap is widely used for host discovery and port scanning.
    # masscan performs very fast large-scale network scans  
    nmap \
    masscan \
    \
    # === Packet capture and traffic analysis ===
    # tcpdump captures packets directly from network interfaces.
    # tshark provides command-line packet analysis similar to Wireshark.
    tcpdump \
    tshark \
    \
    # === Networking utilities ===
    # netcat supports raw network communication and troubleshooting.
    # socat connects sockets, files and processes.
    # dnsutils provides DNS query tools.
    # whois retrieves domain registration information.
    # traceroute and mtr help diagnose network connectivity issues.
    # iproute2, net-tools and iputils-ping provide common networking
    # administration and diagnostic commands.
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Privacy and proxy tools ===
    # tor connects traffic through the Tor anonymity network.
    # torsocks forces applications to use Tor.
    # proxychains4 routes applications through proxy servers.
    # obfs4proxy helps disguise Tor traffic when filtering is present.  
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === User-friendly HTTP client ===
    # httpie provides a more readable interface for learning and testing
    # HTTP requests from the command line.
    httpie \
    \
 # sed -i edits a file in place without creating a separate output file.
# The command enables the Spanish UTF-8 locale by uncommenting its entry
# inside /etc/locale.gen.
#
# locale-gen generates the locale files required by the operating system.
# (Black Hat Bash Ch.2)
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # Package managers leave cache files after installation.
# These files are removed to reduce the final image size.
#
# Cleanup is performed in the same RUN instruction so unnecessary files
# are not preserved in previous image layers. (Black Hat Bash Ch.3)
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# Docker normally uses a default shell for RUN instructions.
# This image explicitly uses bash for future RUN commands, providing
# consistent shell behavior and access to bash features.
SHELL ["/bin/bash", "-c"]


# WORKDIR defines the default working directory used by later commands
# and interactive sessions. It behaves similarly to running cd before
# executing commands.
WORKDIR /workspaces

# Configure Git system-wide settings for all users in the container.
#
# safe.directory allows Git to trust repositories mounted from external
# locations.
#
# init.defaultBranch sets "main" as the default branch name.
#
# pull.rebase false configures Git to use merge behavior during pulls.
#
# git lfs install --system enables Git Large File Storage support globally.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# A here-document (heredoc) allows multiple lines of text to be passed
# directly into a command. The EOF marker defines where the text block
# begins and ends. The > operator redirects the generated content into
# /root/.bashrc. (Redirection — BHB Ch.1)
#
# This configuration creates a custom Bash prompt for the course.
# The function checks the exit code of the previously executed command
# using the special variable $?. A green check mark is displayed when
# the command succeeds, while a red X and the exit code are shown when
# a command fails. (Exit codes — BHB Ch.1)
#
# PS1 defines the appearance of the Bash prompt, including colors,
# the current directory, and command status information.

RUN cat > /root/.bashrc <<'EOF'

# ===== Prompt del curso =====
__set_prompt() {
    local ec=$?
    local mark
    if [ $ec -eq 0 ]; then
        mark='\[\e[32m\]✓\[\e[0m\]'
    else
        mark="\[\e[31m\]✗ $ec\[\e[0m\]"
    fi
    PS1="\[\e[36m\][Arthur_Beltran]\[\e[0m\] \[\e[33m\]\W\[\e[0m\] $mark \$ "
}
PROMPT_COMMAND=__set_prompt
EOF

# RUN instructions execute while the image is being built.
# CMD defines the default command that runs when a container starts.
# In this image, Bash launches automatically when the container is created.

CMD ["/bin/bash"]


