fp=open('nn2.log','w')
for line in open('nn.log','r').readlines():
    if (line.find('302')!=-1):
        line1=line.split(':')[-1].strip(' ')
        fp.writelines(line1)
    else:
        pass

fp.close()
