FROM python:3.10-slim-buster

# PYTHON BUFFER SETTINGS ENSURE ANY ERROR IS SENT TO THE CONTAINER TERMINAL
ENV PYTHONUNBUFFERED=1

WORKDIR /django_tutorial

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt
