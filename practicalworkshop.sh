uname -a
which gpg
gpg --version
gpg --full-generate-key
gpg --list-keys
gpg --armor --export beltranartfire@hotmail.com > mi_llave_publica.asc
cat mi_llave_publica.asc
gpg --list-secret-keys --keyid-format=long