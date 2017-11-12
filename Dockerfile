
FROM ubuntu:latest

ENV PATH /usr/local/bin:$PATH

ENV LANG C.UTF-8

RUN apt-get update -y
RUN apt-get install -y curl
RUN apt-get install -y python-pip python-dev build-essential python3.5 python3-pip
RUN apt-get install -y python3-venv
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
    apt-get -y install mysql-server libmysqlclient-dev

RUN curl https://sdk.cloud.google.com | bash
ENV CONFIG /root/.config/gcloud
ENV PATH /root/google-cloud-sdk/bin:$PATH

