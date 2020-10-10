#!/bin/bash
start=`date +%s`

gmx gyrate -s full_md.tpr -f full_md.xtc -o gyr.xvg

end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
