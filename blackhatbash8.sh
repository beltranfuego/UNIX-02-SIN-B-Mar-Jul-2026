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