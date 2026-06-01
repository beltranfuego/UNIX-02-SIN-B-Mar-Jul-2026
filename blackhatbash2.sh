#!/bin/bash
# All this script does is create a directory, create a file
# within the directory, and then list the contents of the di rectory.
set -x
mkdir mydirectory 
touch mydirectory/myfile 
ls -l mydirectory
set +x

#first result
#[Arthur_Beltran] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ bash -n blackhatbash2.sh 
#[Arthur_Beltran] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ 

#second result
#[Arthur_Beltran] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ bash -x blackhatbash2.sh 
#+ mkdir mydirectory
#mkdir: cannot create directory ‘mydirectory’: El fichero ya existe
#+ touch mydirectory/myfile
#+ ls -l mydirectory
#total 0
#-rw-rw-rw- 1 root root 0 jun  1 13:23 myfile
#[Arthur_Beltran] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ 

#third result
#[Arthur_Beltran] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ bash blackhatbash2.sh 
#+ mkdir mydirectory
#mkdir: cannot create directory ‘mydirectory’: El fichero ya existe
#+ touch mydirectory/myfile
#+ ls -l mydirectory
#total 0
#-rw-rw-rw- 1 root root 0 jun  1 13:24 myfile
#+ set +x
#[Arthur_Beltran] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ 