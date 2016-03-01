#! coding:utf8

#import anydbm
#f = anydbm.open("11.txt")
#print f()
#print (type(f))



f = file("11.txt")
a = f.read()

#c = simplejson.loads(a)
c = eval r(a)

print a
#print c

print(type(a))
print(type(c))




#def openFile(f):
#    return {k.strip():v.strip() for k,v in open(f)}

#openFile(11.txt)

