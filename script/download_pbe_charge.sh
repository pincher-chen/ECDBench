#!/bin/sh
for i in `cat ../data/pbe/filelist.txt`;do 
    wget https://matgen.nscc-gz.cn/chgcar/download/pbe/${i}.tar.gz
done
