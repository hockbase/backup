#! /bin/bash
#connect
for IP in `cat ip.list`
do

{

sleep 2
echo "OPTIONS / HTTP/1.1"
echo "Host:$IP"
sleep 2
echo "get \n"

}|nc $IP 80

done
