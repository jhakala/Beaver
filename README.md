# Beaver
First copy the logs from cmsrc-hcal or cmsrc-top into the same folder where beaver.sh is  
Gunzip them if they gzipped  
Then run beaver with two options: ./beaver.sh (hcalpro or toppro) (search string)  
You may need to escape certain characters  
If you don't see the handsaw colors, use less -R to open the beaverLog  
Examples:  
./beaver.sh toppro 'Recycling:\ HFLUMI'  
./beaver.sh hcalpro '\[HCAL LVL2 HCAL_HF\] Did receive a request to perform special actions due to central CMS clock source change'  
