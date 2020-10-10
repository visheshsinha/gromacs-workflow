#!/bin/bash
start=`date +%s`

gmx trjconv -s full_md.gro -f full_md.xtc -e 2500.0 -o protein_simul.pdb

end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
