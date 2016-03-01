#!/bin/bash
ns=$1

for i in `cat ali3.list`
do
echo " ==========$i==========="
dig @$ns $i |grep -v ";"|grep -v ^$
done

