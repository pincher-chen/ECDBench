#!/bin/sh
for i in `cat ./filelist.txt`;do 
    #wget https://xx/chgcar/download/gnome/${i} # To maintain anonymity, we have hidden the download link. 
    wget https://matgen.nscc-gz.cn/chgcar/download/gnome/${i}
done
