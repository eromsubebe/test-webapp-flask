# FROM ubuntu:16.04

# RUN apt-get update && apt-get install -y python3.7 python3-pip python3.7-dev

# COPY app.py /opt/

# RUN pip install flask 

# ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080

# FROM python:3.8-slim-buster

# WORKDIR /python-docker

# COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt

# COPY . .

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" "--port=8080"]

FROM ubuntu:16.04

WORKDIR /opt

COPY app.py /opt/

RUN apt-get update && \
        apt-get install -y software-properties-common && \
        add-apt-repository ppa:jonathonf/python-3.6 && \
        apt-get update -y  && \
        apt-get install -y build-essential python3.6 python3.6-dev python3-pip && \
        apt-get install -y git  && \
        # update pip
        python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install flask

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080