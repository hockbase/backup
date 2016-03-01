#! /usr/local/bin/python
# coding=utf-8

import urllib2
import re

def getHtml(url):
    page = urllib2.urlopen(url)
    html = page.read()
    return html

def getLink(html):
    reg = r'href="(*)" pic_ext'
    link = re.compile(reg)
    linklist = re.findall(link,html)
    x = 0
    for linkurl in linklist:
        urllib2.urlopen(imgurl,'%s' % x)
        x+=1

html = getHtml("http://ru.dhgate.com/")
a = getLink.getcode()
print a

