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
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    bash \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
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
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Prompt del curso para bash

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
CMD ["/bin/bash"]


