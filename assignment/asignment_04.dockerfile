FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
 apt-get -y install\
 python3\
 python3-pip\
 python3-numpy\
 python3-pandas\
 git
RUN wget https://github.com/CivetWang/HPCHarryW/blob/main/assignment/assignment_04.sh
RUN chmod +x assignment_04.sh
RUN bash assignment_04.sh