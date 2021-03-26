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
	&& apt install jq -y \
	&& apt install software-properties-common -y \
	&& add-apt-repository -y ppa:deadsnakes/ppa \
	&& apt install python3.8 -y \
	&& apt install python3-pip -y \
	&& apt install python-snappy -y \
	&& apt install libsnappy-dev -y 

RUN apt -y install tzdata \
	&& ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata \
	&& rm /usr/bin/python3 \
	&& ln -s /usr/bin/python3.8 /usr/bin/python3 

RUN  python3 -m pip install pip --upgrade \
	&& python3 -m pip install \
		kafka-python python-snappy ezdxf  shapely numpy pandas lxml bs4 html5lib xlrd \
		requests flask flask_restful 

RUN python3 -m pip install joblib 
RUN apt -y install postgresql libpq-dev postgresql-client postgresql-client-common
# RUN python3 -m pip install tensorflow
# RUN python3 -m pip install kubeflow-kale
RUN apt-get -y install python3.8-dev iputils-ping
RUN python3 -m pip install psycopg2 

