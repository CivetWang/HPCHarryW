#!/bin/bash
#SBATCH -J python
#SBATCH -o assignment_05.out
#SBATCH -p htc
#SBATCH --mem=6G

module purge
module load python
module load singularity
hostname
cat /proc/cpuinfo
free -g
srun singularity run docker://civetw/lab:py3

