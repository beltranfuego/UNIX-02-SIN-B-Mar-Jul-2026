uname -a    #Shows system information (kernel, architecture, etc.)
which gpg   #Displays the path where gpg is installed
gpg --version       #Shows the GPG version and its features
gpg --full-generate-key     #Creates a new key pair (public and private)
gpg --list-keys     #Lists stored public keys
gpg --armor --export beltranartfire@hotmail.com > mi_llave_publica.asc      #Exports your public key in text (armor) format (.asc)
cat mi_llave_publica.asc        #Displays the public key content on screen
      #Lists your private keys with long identifiers
gpg --armor --export-secret-keys        #Exports your private keys in text format (sensitive use)
gpg --import INGE_llave_publica.asc     #Imports someone else's public key
echo "hola webitas lol xd uwu zzz" > doc_no_cifrado.txt   #Writes a message and creates a new file
gpg --output doc_cifrafo_para_inge.txt --encrypt --recipient "hash or email of the person" doc_no_cifrado.txt       
#Encrypts the file using the recipient's public key, so only they can decrypt it
#--output specifies the name of the resulting file
gpg --list-secret-keys --keyid-format=long  #Shows your private keys with long ID
gpg --decrypt doc_cifrado.txt       #Decrypts a file using your private key
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt      #Signs the file in readable text format (visible signature)
cat doc_no_cifrado_firmado.txt      #Displays the file content in the terminal
gpg --verify MICOMPA_doc_no_cifrado_firmado.txt     #Verifies that the file signature is valid
gpg --edit-key XXXXXXXXXXXXXXXXXXXXXX   #Opens key settings (to change trust, etc.)
                                         #trust → sets trust level, 4 → full trust, q → quit
gpg --sign-key XXXXXXXXXXX  #Signs another person's public key (you trust it)
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt       #Signs the file in binary format (not readable)
gpg --verify MICOMPA_doc_no_cifrado_firmado_binario.txt     #Verifies the binary signature
gpg --output firma_separada_doc_no_cifrado.sig --detach-sign doc_no_cifrado.txt     #Creates a detached signature (.sig file)
gpg --verify MICOMPA_firma_separada_doc_no_cifrado.sig MICOMPA_doc_no_cifrado.txt       #Verifies a file using its detached signature
gpg --output doc_cifrado_y_firmado.txt --encrypt --sign --recipient XXXXXXX doc_no_cifrado.txt     
#Encrypts with the recipient’s public key and signs with your private key
gpg --output doc_cifrado_y_firmado_descifrado_y_validado.txt --decrypt MICOMPA_doc_cifrado_y_firmado.txt
#Decrypts the file and automatically verifies the signature
cat doc_cifrado_y_firmado_descifrado_y_validado.txt     #Displays the decrypted file in the terminal