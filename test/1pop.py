# coding=utf-8

import re
import urllib2
from MyHTMLParser import MyHTMLParser

url = 'http://ru.dhgate.com/'

if __name__ == "__main__":
    data = urllib2.urlopen(url).read()
    hp = MyHTMLParser()
    hp.feed(data)
    hp.close()
    for link in hp.links:
        print link
        a = urllib2.urlopen(link).getcode()
        print a,link

