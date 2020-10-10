#!/bin/bash
start=`date +%s`

gmx grompp -f nvt.mdp -c em.gro -r em.gro -p 1.top -o nvt.tpr

gmx mdrun -deffnm nvt

gmx grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p 1.top -o npt.tpr

gmx mdrun -deffnm npt

gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p 1.top -o full_md.tpr

gmx mdrun -deffnm full_md

gmx rms -s full_md.tpr -f full_md.xtc -o rmsd.xvg

end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
