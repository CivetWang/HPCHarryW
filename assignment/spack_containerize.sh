#!/usr/bin/env sh

# Define the Spack environment
cat lab_01.yaml

# Build container definition file
spack containerize > Dockerfile

# Build the container image
docker build -t gromacs:latest .

