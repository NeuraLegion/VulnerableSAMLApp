FROM ubuntu:bionic

RUN apt-get update -y
RUN apt-get install -y python2.7 python2.7-dev libxmlsec1 libxmlsec1-dev git python-pip python-dev build-essential nginx
RUN pip install --upgrade pip
RUN pip install -U setuptools
RUN pip install uwsgi

RUN mkdir /vulnerableSP
WORKDIR /vulnerableSP
COPY ./requirements.txt /vulnerableSP/requirements.txt
RUN pip install -r requirements.txt

COPY . /vulnerableSP
RUN chmod +x /vulnerableSP/start.sh


EXPOSE 8000

CMD ["/bin/bash", "/vulnerableSP/start.sh"]
