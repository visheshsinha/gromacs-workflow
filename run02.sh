#!/bin/bash
start=`date +%s`

gmx grompp -f minim.mdp -c water_ions.gro -p 1.top -o energyminimization.tpr

gmx mdrun -v -s energyminimization.tpr -deffnm em  

gmx energy -f em.edr -o potential.xvg


end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
