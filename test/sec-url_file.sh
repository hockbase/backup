#! /bin/bash

# invoker/JMXInvokerServlet
# jmx-console


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
