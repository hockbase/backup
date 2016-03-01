#!/bin/bash

domain=$1

for i in `cat trac4.dat`
do
	echo ======= $url =======
	url=`echo $i | sed "s/aaaaaaaaaa/$domain/g"`
	curl "$url"
done

