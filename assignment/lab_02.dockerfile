# Build stage with Spack pre-installed and ready to be used
FROM spack/ubuntu-bionic:latest as builder

# What we want to install and how we want to install it
# is specified in a manifest file (spack.yaml)
RUN mkdir /opt/spack-environment \
&&  (echo "spack:" \
&&   echo "  config:" \
&&   echo "  - install_missing_compilers: true" \
&&   echo "    install_tree: /opt/software" \
&&   echo "  compilers: [gcc@10.3.0, gcc@11.2.0]" \
&&   echo "  packages:" \
&&   echo "  - bash@5" \
&&   echo "  - openblas threads=openmp" \
&&   echo "  - python@3.8.12" \
&&   echo "  - py-numpy+blas+lapack" \
&&   echo "  - py-scipy" \
&&   echo "  - py-matplotlib" \
&&   echo "  - py-Pandas" \
&&   echo "  concretizer: together" \
&&   echo "  view: /opt/view") > /opt/spack-environment/spack.yaml

# Install the software, remove unnecessary deps
RUN cd /opt/spack-environment && spack env activate . && spack install --fail-fast && spack gc -y

# Strip all the binaries
RUN find -L /opt/view/* -type f -exec readlink -f '{}' \; | \
    xargs file -i | \
    grep 'charset=binary' | \
    grep 'x-executable\|x-archive\|x-sharedlib' | \
    awk -F: '{print $1}' | xargs strip -s

# Modifications to the environment that are necessary to run
RUN cd /opt/spack-environment && \
    spack env activate --sh -d . >> /etc/profile.d/z10_spack_environment.sh

# Bare OS image to run the installed executables
FROM ubuntu:18.04

COPY --from=builder /opt/spack-environment /opt/spack-environment
COPY --from=builder /opt/software /opt/software
COPY --from=builder /opt/view /opt/view
COPY --from=builder /etc/profile.d/z10_spack_environment.sh /etc/profile.d/z10_spack_environment.sh

ENTRYPOINT ["/bin/bash", "--rcfile", "/etc/profile", "-l"]


#Reference from https://spack.readthedocs.io/en/latest/containers.html