FROM python:3.10-alpine

# PYTHON BUFFER SETTINGS ENSURE ANY ERROR IS SENT TO THE CONTAINER TERMINAL
ENV PYTHONUNBUFFERED=1

# Dependencies to get Postgres working on alpine
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

WORKDIR /django_tutorial

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt
