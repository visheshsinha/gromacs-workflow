#!/bin/bash
start=`date +%s`

gmx rmsf -s full_md.tpr -f full_md.xtc -res -o rmsf.xvg

end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
