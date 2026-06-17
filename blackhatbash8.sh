#!/bin/bash
awk '{print $1}' log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $1,$NF}' log.txt
head log.txt
awk 'NR < 10' log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'
sed 's/Mozilla/Godzilla/g' log.txt
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "Mozilla" log.txt      #we check whether there is Mozilla or Godzilla 
grep "Godzilla" log.txt
grep "Mozilla" newlog.txt   #the same
grep "Godzilla" newlog.txt
sed 's/ //g' log.txt
sed '1d' newlog.txt > newlogd.txt
sed '$d' newlog.txt > newlogl.txt
sed '5,7d' newlog.txt > newlog57.txt
sed -n '2,15 p' log.txt
sed -i '1d' log.txt
sleep 100 &     #[1] 21148
ps -ef | grep sleep     
#root           1       0  0 12:14 ?        00:00:00 /bin/sh -c echo Container started trap "exit 0" 15  exec "$@" while sleep 1 & wait $!; do :; done -
#root       21148    2258  0 13:10 pts/0    00:00:00 sleep 100
#root       21396       1  0 13:10 ?        00:00:00 sleep 1
#root       21408    2258  0 13:10 pts/0    00:00:00 grep sleep
fg %1
#sleep 100
bg %1
#[1]+ sleep 100 &
nohup ./exercise2.sh &
#nohup: se descarta la entrada y se añade la salida a 'nohup.out'
