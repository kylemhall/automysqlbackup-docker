#!/bin/bash

envsubst < "/app/files/debian.cnf" > "/etc/mysql/debian.cnf"
envsubst < "/app/files/automysqlbackup.conf" > "/etc/default/automysqlbackup"
automysqlbackup
