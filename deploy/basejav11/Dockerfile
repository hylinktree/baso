FROM ubuntu:18.04
RUN echo "alias l='ls -al --color=never'" >> /root/.bashrc \
	&& echo "alias gf='git fetch;git pull'" >> /root/.bashrc \
	&& echo "alias gfm='gf;gm'" >> /root/.bashrc \
	&& echo "alias gm='git commit -amnocomment;git push'" >> /root/.bashrc \
	&& echo "alias gs='git status'" >> /root/.bashrc 

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y \
	&& apt install apt-utils -y  \
	&& apt install wget -y \
	&& apt install vim -y \
	&& apt install curl -y \
	&& apt install jq -y 

RUN apt install openjdk-11-jdk -y

RUN apt -y install tzdata \
	&& ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata 

RUN apt install iputils-ping -y

