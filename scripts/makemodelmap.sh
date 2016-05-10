#!/bin/bash
outp=`curl -s 'http://cordex.dmi.dk/joomla/images/CORDEX/RCMModelName.txt'|grep -v '#'|grep 'confirmed'|tr -s ' '`;
echo "rcm_name_map = map(project,rcm_model : rcm_name)"
echo "$outp" |while read ln; do
        inst=`echo $ln|cut -d' ' -f2`;
        res=`echo $ln| sed "s/$inst-\(.*\) \(.*\) confirmed/\tcordex| $inst-\1| \1/"`
        echo -e "$res"
done

