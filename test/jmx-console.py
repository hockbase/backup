import telnetlib,os
fp_out=open('out.txt','w')
fp=open('1.txt','w')
fp_ip=open('ip_','r')
ips=fp_ip.readlines()
try:
    for host in ips:
        tn=telnetlib.Telnet(host,port=80)
                tn.set_debuglevel(3)
                tn.write('OPTIONS / HTTP/1.1'+'\n')
                tn.write('Host:172.16.20.101'+'\n\n')
                out=tn.read_until('th=')
                tn.write('EXIT'+'\n')
                tn.close()
                fp.writelines(out)
                fp.close()
                for line in open('1.txt','r').readlines():
                    if line.find('Allow')!=-1:
                            if line.find('HEAD')!=-1 or line.find('OPTIONS')!=-1:
                                    fp_out.write(host+'\n-----------------------\n')
                                        fp_out.write(line+'\n-----------------------\n')
        fp_out.close()
except:
    pass
