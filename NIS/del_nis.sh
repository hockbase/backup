#! /bin/bash

sed -i '/rhome/ d' /etc/auto.nis
sed -i '/rhome/ d' /etc/auto.master 
sed -i '/DHGATE/ d' /etc/sysconfig/network
sed -i '/DHGATE/ d' /etc/rc.d/rc.local
sed -i '/ypserver/ d' /etc/yp.conf
sed -i '/DHGATE/ d' /etc/yp.conf

