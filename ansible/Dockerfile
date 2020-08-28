FROM ubuntu:bionic

RUN apt-get update
RUN apt-get -y install python3 python3-nacl python3-pip libffi-dev openssh-server

RUN pip3 install ansible

COPY ./ /ansible
WORKDIR /ansible
RUN mkdir ~/.ssh
RUN cat ./keys/deploy-swarm.pem > ~/.ssh/id_rsa
RUN chmod 400 ~/.ssh/id_rsa
