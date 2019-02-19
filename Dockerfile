FROM debian:stretch-slim

ENV DBNAMES="all"

RUN apt-get update -y \
    && apt-get -y install \
        automysqlbackup \
        gettext-base

COPY . /app
WORKDIR /app

VOLUME /backups

CMD /app/start.sh
