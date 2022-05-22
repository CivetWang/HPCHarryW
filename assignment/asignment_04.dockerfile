FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
WORKDIR git https://github.com/CivetWang/HPCHarryW/blob/main/assignment/
COPY --from= /assignment_04.sh ./
RUN /bin/bash -c ‘assignment_04.sh’