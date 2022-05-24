FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
Run git clone https://github.com/CivetWang/HPCHarryW/blob/main/assignment/ && \
	cd Work && \
	make Assignment
RUN chmod +x /assignment_04.sh
RUN /bin/bash -c ‘assignment_04.sh’