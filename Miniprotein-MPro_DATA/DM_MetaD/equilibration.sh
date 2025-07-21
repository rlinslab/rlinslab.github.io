#!/bin/bash

# Define the initial force constants
FC_BB=5000.0
FC_SC=5000.0

# Check if minimization step is needed
if [ ! -f em.gro ]; then
  # Perform minimization
  gmx grompp -f em.mdp -c step3_input.gro -p topol.top -o em.tpr
  gmx mdrun -v -deffnm em
fi

# Check if NVT equilibration step is needed
if [ ! -f nvt.gro ]; then
  # Perform NVT equilibration
  gmx grompp -f md-mm-nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr -n index.ndx
  gmx mdrun -v -deffnm nvt -nb gpu -bonded gpu -pme gpu -update gpu
fi

# Modify the NPT file for step 1 to have the desired forces
sed -i "s/-DPOSRES_FC_BB=.* -DPOSRES_FC_SC=.*;/-DPOSRES_FC_BB=5000.0 -DPOSRES_FC_SC=5000.0;/" md-mm-npt.mdp

# Check if NPT equilibration step 1 is needed
if [ ! -f npt1.gro ]; then
  # Perform NPT equilibration step 1
  gmx grompp -f md-mm-npt.mdp -c nvt.gro -r nvt.gro -p topol.top -n index.ndx -o npt1.tpr
  gmx mdrun -v -deffnm npt1 -bonded gpu -pme gpu -update gpu
fi

# Perform NPT equilibration steps 2 to 6
for ((step=2; step<=6; step++)); do
  # Check if NPT equilibration step is needed
  if [ ! -f npt${step}.gro ]; then
    # Update the force constants
    if ((step == 6)); then
      FC_BB=1000.0
      FC_SC=0.0
    else
      FC_BB=$((5000 - (step-1) * 1000))
      FC_SC=$((5000 - (step-1) * 1000))
    fi

    # Modify the NPT file with the updated force constants
    sed -i "s/-DPOSRES_FC_BB=.* -DPOSRES_FC_SC=.*;/-DPOSRES_FC_BB=${FC_BB} -DPOSRES_FC_SC=${FC_SC};/" md-mm-npt.mdp

    # Perform NPT equilibration
    gmx grompp -f md-mm-npt.mdp -c npt$((step-1)).gro -r npt$((step-1)).gro -p topol.top -n index.ndx -o npt${step}.tpr
    gmx mdrun -v -deffnm npt${step} -nb gpu -bonded gpu -pme gpu -update gpu
  fi

# Check if minimization step is needed
if [ ! -f npt7.gro ]; then
  # Perform minimization
  gmx grompp -f prod_horta -c npt6.gro -r npt6.gro -p topol.top -n index.ndx -o md_core25_complex_rep1.tpr
  gmx mdrun  -v -deffnm md_core25_complex_rep1 -nb gpu -bonded gpu -pme gpu -update gpu
fi


done


# Display equilibration completion message
echo "Equilibration process finished."
