uname -a    #Muestra información del sistema (kernel, arquitectura, etc.)
which gpg   #Indica la ruta donde está instalado gpg
gpg --version       #Muestra la versión de GPG y sus características
gpg --full-generate-key     #Crea un nuevo par de claves (pública y privada)
gpg --list-keys     #Lista las claves públicas almacenadas
gpg --armor --export beltranartfire@hotmail.com > mi_llave_publica.asc      #Exporta tu clave pública en formato texto(armor) (.asc)
cat mi_llave_publica.asc        #Muestra el contenido de la clave pública en pantalla
gpg --list-secret-keys --keyid-format=long      #Lista tus claves privadas con identificadores largos
gpg --armor --export-secret-keys        #Exporta tus claves privadas en formato texto (uso delicado)
gpg --import INGE_llave_publica.asc     #Importa la llave publica de alguien mas 
