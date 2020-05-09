FROM python:3.7.7-alpine3.11
MAINTAINER Martin Pham

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# add a user to only execute programs
# this makes sure that the user does not have
# a home directory or login for security reasons
RUN adduser -D user
USER user
