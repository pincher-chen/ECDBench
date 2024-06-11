#!/bin/sh
for i in `cat ./filelist.txt`;do 
    wget https://matgen.nscc-gz.cn/chgcar/download/hse/${i}.tar.gz
done
