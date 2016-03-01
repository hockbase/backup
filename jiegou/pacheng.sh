#!/bin/bash

ym=$1
#gl="awk -F\. $ym '{print $2}'"
gl=$2

curl $ym |grep href|awk -F "(http://|https://)" '{print $2}'|grep "$gl"|awk -F\" '{print $1}'|awk -F\/ '{print $1}'|grep $gl|sort -n |uniq
#curl $ym |grep href|awk -F "(http://|https://)" '{print $2}'|grep "$gl"|awk -F\" '{print $1}'|awk -F\/ '{print $1}'|sort -n |uniq


