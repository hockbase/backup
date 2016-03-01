#! /bin/bash

# invoker/JMXInvokerServlet
# jmx-console

#119.254.16.112/28
#124.42.15.0/24
#119.254.33.144/28
#119.254.16.96/28
#117.121.33.0/24
#117.121.46.0/24
#119.253.63.192/27
#119.255.252.0/26
#115.231.81.128/27
#115.231.81.160/27
#115.231.81.192/27

ip_a="$1"
file="jmx-console"

for ((i=1;i<255;i++))
do
    url="http://$ip_a$i/$file"
    httpcode=`curl -I -m 1 -o /dev/null -s -w %{http_code} $url`

    if [ $httpcode != 000 ];then
    echo "$httpcode :  $url" >> sec_jmx.log
    fi
done
