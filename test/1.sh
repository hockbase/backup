#! /bin/bash

#for i in `cat 7777.log`
for i in `cat name.log`
do
	httpcode=`curl -I -m 1 -o /dev/null -s -w %{http_code} "http://$i"`
	echo $httpcode : "$i"
done
