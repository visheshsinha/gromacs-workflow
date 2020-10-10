#!/bin/bash
start=`date +%s`

gmx pdb2gmx -f subject.pdb -o 1.gro -p 1.top -water spce -ff oplsaa

# printf "\nUse this command while working to ignore the hydrogen atoms if consisted, because it generates few complications while compiling in later phases: \n"
# gmx pdb2gmx -f subject.pdb -o 1.gro -p 1.top -water spce -ignh

gmx editconf -f 1.gro -o box.gro -c -d 1.0 -bt cubic

gmx solvate -cp box.gro -cs spc216.gro -o water_box.gro -p 1.top

gmx grompp -f ions.mdp -c water_box.gro -p 1.top -o ions.tpr

gmx genion -s ions.tpr -o water_ions.gro -p 1.top -pname NA -nname CL -neutral


end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
