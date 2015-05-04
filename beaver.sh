#!/bin/bash
################################################
# First copy the logs from cmsrc-hcal or cmsrc-top into the same folder where beaver.sh is
# Gunzip them if they gzipped
# Then run beaver with two options: ./beaver.sh <hcapro or toppro> <search string>
# You may need to escape certain characters
# If you don't see the handsaw colors, use less -R to open the beaverLog
# Examples:
# ./beaver.sh toppro 'Recycling:\ HFLUMI'
# ./beaver.sh hcalpro '\[HCAL LVL2 HCAL_HF\] Did receive a request to perform special actions due to central CMS clock source change'
################################################
D="beaverLog_`date +%H.%M.%S`.txt" 
if [ $1 = "toppro" ]; then
	snip=': cms.toppro.rcms.fm.levelZeroFM.MyFunctionManager\n'
elif [ $1 = "hcalpro" ]; then
	snip=': cms.hcalpro.rcms.fm.app.level1.HCALlevelTwoEventHandler\n' 
else
	echo "beaver doesn't like the log you fed him... he chomps on either 'toppro' or 'hcalpro' logs!"
	exit
fi	
cat Logs_$1.xml.* |\
~/Handsaw.pl |\
grep -B 1 "$2" |\
grep -v -- "^--$"|\
sed  ":a;N;\$!ba;s/${snip}/ /g"|
sort > $D
