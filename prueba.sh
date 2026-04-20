 1  ls 
    2  ls nebula/
    3  ls .nebula/
    4  ls .
    5  mv registros bitacoras
    6  cd nebula
    7  ls
    8  ls -a
    9  ls -l
   10  mkdir bitacoras
   11  mkdir borradores
   12  mv cosmos.txt /bitacoras
   13  git add .
   14  git commit -m "Fix problema 1: estructura de directorios corregida"
   15  mv cosmos.txt bitacoras/
   16  mv estrella.bak estrella.conf
   17  git add .
   18  git commit -m "Fix problema 2: archivos movidos y renombrados"
   19  cd bitacoras
   20  chmod 640 bitacoras/cosmos.txt
   21  chmod 640 cosmos.txt
   22  cd bitacoras
   23  ls -l
   24  git add .
   25  git commit -m "Fix problema 3: permisos numericos 640 en cosmos.txt"
   26  chmod u+x galaxia.sh
   27  cd nebula
   28  cd .
   29  cd ..
   30  chmod u+x galaxia.sh
   31  chmod o-w estrella.conf
   32  git add .
   33  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   34  chmod u+s galaxia.sh
   35  ls -l galaxia.sh
   36  git add .
   37  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   38  chmod +t /tmp/nebula_zone
   39  cd ~/temp
   40  cd temp/
   41  cd /tmp/nebula_zone
   42  chmod +t /tmp/nebula_zone
   43  mkdir -p /tmp/nebula_zone
   44  cd /tmp/nebula_zone
   45  sudo chmod +t /tmp/nebula_zone
   46  rmmkdir /tem/nebula_zone
   47  rmkdir /temp/nebula_zone
   48  rmdir /temp/nebula_zone
   49  rmdir /tmp/nebula_zone
   50  cd ..
   51  cd ~
   52  cd ..
   53  cd /workspaces/UNIX-02-SIN-B-Mar-Jul-2026/nebula
   54  rmdir /tmp/nebula_zone
   55  cd /tmp/nebula_zone
   56  sudo chmod +t /tmp/nebula_zone
   57  mkdir -p /tmp/nebula_zone
   58  sudo chmod +t /tmp/nebula_zone
   59  ls -ld /tmp/nebula_zone
   60  sudo chmod 1777 /tmp/nebula_zone
   61  ls -ld /tmp/nebula_zone
   62  git add .
   63  git commit -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   64  gpg --full-generate-key
   65  gpg --encrypt --recipient aurora@nebula.lab bitacoras/cosmos.txt
   66  git add .
   67  git commit -m "Fix problema 7: llave GPG generada y cosmos.txt cifrado"
   68  gpg --clearsign estrella.conf
   69  gpg --verify galaxia.sh.sig galaxia.sh
   70  gpg --verify nebula/galaxia.sh.sig nebula/galaxia.sh
   71  gpg --verify galaxia.sh.sig galaxia.sh
   72  gpg --list-keys
   73  history