#!/bin/bash -l
#
#
#SBATCH -J test # A single job name for the array
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # All cores on one machine
#SBATCH --mem 9000 # Memory request
#SBATCH -t 0-2:00 # 2 hours (D-HH:MM)
#SBATCH -o output/test%A%a.out # Standard output
#SBATCH -e output/test%A%a.err # Standard error
#SBATCH --mail-type=END # Type of email notification- BEGIN,END,FAIL,ALL
##SBATCH --mail-user=NETID@duke.edu # Email to which notifications will be sent

##cd /getlab/NETID/test

##matlab -nojvm -nodisplay -r "k=${SLURM_ARRAY_TASK_ID};gen_images(k, 50, 1, -3);"
matlab -nojvm -nodisplay -r "k=${SLURM_ARRAY_TASK_ID};gen_images(k, 50, 0, -3);"