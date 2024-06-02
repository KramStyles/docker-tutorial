# Get the base image we will pull and build fon top of. Alpine is a bare minimum lightweight linux container.
FROM python:3.9-alpine3.13

# Set up who manages and maintains the image
LABEL maintainer="kramstyles@outlook.com"

# PYTHON BUFFER SETTINGS ENSURE ANY ERROR IS SENT TO THE CONTAINER TERMINAL
ENV PYTHONUNBUFFERED 1

# Copy our requirements file to a temporary folder
COPY ./requirements.txt /tmp/requirements.txt

# Copy the project folder to the container and set it as the working directory
COPY ./project /project
WORKDIR /project

# Expose the port we would run in our browser.
EXPOSE 8000

# Creates a new virtual environment
# specify the full path and upgrade the pip manager
# We install the requirements from the temp folder
# We remove the temporary folder after installation. To keep the container as light as possible.
# Adding a new user so as not to use the root user.
RUN python -m venv /env && \
    /env/bin/pip install --upgrade pip && \
    /env/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# set up our new path to run all commands from the virtual path
ENV PATH="/env/bin:$PATH"

# All commands from this point will originate from the new user
USER django-user


# # Dependencies to get Postgres working on alpine
# RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# WORKDIR /django_tutorial