#!/bin/bash
################################################
# Example: ./beaver.sh toppro "Recycling:\sHFLUMI"
################################################
cat Logs_$1.xml.2 |\
~/Handsaw.pl |\
grep -B 1 $2 |\
grep -v -- "^--$"|\
sed ':a;N;$!ba;s/: cms.toppro.rcms.fm.levelZeroFM.MyFunctionManager\n/ /g'|
sort #>\
#beaverLog_$1_$2.txt 
