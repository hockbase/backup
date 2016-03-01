#! /usr/bin/expect -f

for IP in `cat ip.list`
do
spawn nc $IP 80
expect ""
send "OPTIONS / HTTP/1.1"
send "Host:$IP"
send "get"

done
