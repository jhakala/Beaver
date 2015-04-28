#!/bin/bash
cat Logs_toppro.xml.* |\
~/Handsaw.pl |\
grep -B 1 "Recycling: HFLUMI" |\
grep -v -- "^--$"|\
sed ':a;N;$!ba;s/: cms.toppro.rcms.fm.levelZeroFM.MyFunctionManager\n/ /g'|
sort >\
topproHFrecycleLog.txt 

