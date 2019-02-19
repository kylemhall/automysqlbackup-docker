# automysqlbackup-docker

automysqlbackup-docker is a simple docker image for running automysqlbackup.

## Setup

* Create a user for automysqlbackup to use:
  * `GRANT EVENT, LOCK TABLES, SELECT ON *.* to 'automysqlbackup'@'%' IDENTIFIED BY 'password';`
  * `FLUSH PRIVILEGES;`
* Create a directory `backups` on your host system, this is where the sql files will be stored.
* Create the file `automysqlbackup.env` on your host system.
* In that file, set the following directives:
```
USERNAME=automysqlbackup
PASSWORD=password
DBHOST=my-db-container
```
* Set up a cronjob on the host system to run this command nightly, `docker run --rm -v /path/to/backups:/backups --env-file /path/to/automysqlbackup.env --network my-database-network automysqlbackup` where my-database-network is a Docker network that the database container shares with the automysqlbackup container.
