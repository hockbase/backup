#! /bin/bash

cat>>/etc/profile<<EOF
function command2syslog
{
        auid_command=\$(history 1|{ read x cmd; echo "\$cmd"; })
        auid_ip=\$(who am i |awk '{print \$5}')
        logger -p user.notice -- \$auid_ip :  \$auid_command
}
trap command2syslog DEBUG
EOF

cat>>/etc/syslog.conf<<EOF
user.notice	@172.21.200.12
EOF

service syslog restart
chkconfig --level 35 syslog on

