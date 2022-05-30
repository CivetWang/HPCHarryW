#!/bin/bash
#SBATCH -J python
#SBATCH -o assignment_05.out
#SBATCH -p htc
#SBATCH --mem=6G

module purge
module load python
module load singularity


singularity run docker://civetw/lab:py3

hostname
cat /proc/cpuinfo
free -g