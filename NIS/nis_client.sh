#! /bin/bash

# deploy BackUp
cp /etc/sysconfig/network /etc/sysconfig/network.save_nis
cp /etc/rc.d/rc.local /etc/rc.d/rc.local.save_nis
cp /etc/yp.conf /etc/yp.conf.save_nis
cp /etc/nsswitch.conf /etc/nsswitch.conf.save_nis
cp /etc/auto.master /etc/auto.master.save_nis
cp /etc/auto.nis /etc/auto.nis.save_nis
cp /etc/sysconfig/authconfig /etc/sysconfig/authconfig.save_nis
cp /etc/pam.d/system-auth /etc/pam.d/system-auth.save_nis
cp /etc/hosts /etc/hosts.save_nis

# deploy autofs 
echo "*       172.21.200.12:/data/rhome/&" >> /etc/auto.nis
echo "/rhome  /etc/auto.nis" >> /etc/auto.master
service autofs restart
chkconfig --level 35 autofs on

# deploy nis
/bin/nisdomainname NIS.DHGATE.IN
echo "NISDOMAIN=NIS.DHGATE.IN" >> /etc/sysconfig/network
echo "/bin/nisdomainname	NIS.DHGATE.IN" >> /etc/rc.d/rc.local
echo "ypserver        172.21.200.12" >> /etc/yp.conf
echo "domain          NIS.DHGATE.IN" >> /etc/yp.conf
echo "172.21.200.12	lg_obziuv_ops" >> /etc/hosts

# deploy nsswitch
sed -i 's/^passwd.*/passwd:	files nis/g' /etc/nsswitch.conf
sed -i 's/^shadow.*/shadow:	files nis/g' /etc/nsswitch.conf
sed -i 's/^group.*/group:	files nis/g' /etc/nsswitch.conf
sed -i 's/USENIS=no/USENIS=yes/g' /etc/sysconfig/authconfig
sed -i 's/shadow/shadow nis/g' /etc/pam.d/system-auth

# deploy portmap or rpcbind
if [ -f "/etc/init.d/portmap" ];then
	service portmap restart
	chkconfig --level 35 portmap on
elif [ -f "/etc/init.d/rpcbind" ];then
	service rpcbind restart
	chkconfig --level 35 ypbind on
else
	echo "Error: No find portmap or rpcbind service"
fi


service ypbind restart
chkconfig --level 35 ypbind on

