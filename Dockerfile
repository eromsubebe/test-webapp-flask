# FROM ubuntu:16.04

# RUN apt-get update && apt-get install -y python3.7 python3-pip python3.7-dev

# COPY app.py /opt/

# RUN pip install flask 

# ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
# ============
# FROM python:3.8-slim-buster

# WORKDIR /python-docker

# COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt

# COPY . .

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" "--port=8080"]

FROM ubuntu:16.04
RUN apt-get update && apt-get install -y python python-pip
RUN pip install flask
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080