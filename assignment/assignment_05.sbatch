#!/bin/bash

#SBATCH -J python
#SBATCH -o python_%j.out
#SBATCH -p htc
#SBATCH --mem=6G

module purge
module load python
module singularity

srun -p htc --mem=6G --pty "singularity run docker://civetw/lab:py3"

cat /proc/cpuinfo