#! /bin/bash


#for ip in `cat int_ip.txt`
#do
#url="http://$ip/jmx-console"
#httpcode="curl -I -m 10 -o /dev/null -s -w %{http_code} http://$ip/jmx-console"
#if [ $httpcode != 404];then
#echo "$httpcode /r $url" >> jmx.log
#done


ip_a="124.42.15."
for ((i=1;i<255;i++))
do

	url="http://$ip_a$i/jmx-console"
	httpcode=`curl -I -m 1 -o /dev/null -s -w %{http_code} http://$ip_a$i/jmx-console`
	
	if [ $httpcode != 000 ];then
	echo "$httpcode :  $url"
	fi

done


