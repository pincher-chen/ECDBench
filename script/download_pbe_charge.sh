#!/bin/sh
for i in `cat ../data/filelist.txt`;do 
    wget https://matgen.nscc-gz.cn/chgcar/download/pbe/${i}.tar.gz
done
