#!/bin/bash

url="www.ebay.com"
par="href"



#dname=`curl $url |grep "$par"|awk -F'$par' '{print $2}'|awk -F\" '{print $2}'|awk -F\/ '{print $3}'|sort -n|uniq`
dname=`curl $url |grep "$par"|cut -d'$par' -f 2|cut -d'"' -f 2|cut -d'/' -f 3|sort -n|uniq`

for i in $dname
#for i in `curl $url |grep "$par"|awk -F'$par' '{print $2}'|awk -F\" '{print $2}'|awk -F\/ '{print $3}'|sort -n|uniq`
do
dig $i @202.106.0.20 |grep -v ';'
dig $i @8.8.8.8 |grep -v ';'
done

echo $url
echo $par
echo $dname

