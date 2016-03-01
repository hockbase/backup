#!/usr/bin/python

import telnetlib,os

fp=open('1.txt','w')
host= '172.16.20.101'
tn = telnetlib.Telnet(host,port=80)
tn.set_debuglevel(3)
tn.write('OPTIONS / HTTP/1.1'+'\n')
tn.write('Host:172.16.20.101'+'\n\n')
out=tn.read_until('th=')
tn.write('EXIT'+'\n')
tn.close()
fp.writelines(out)
fp.close()

