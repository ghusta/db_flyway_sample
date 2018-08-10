# db_flyway_sample

[![Build Status](https://travis-ci.org/ghusta/db_flyway_sample.svg?branch=master)](https://travis-ci.org/ghusta/db_flyway_sample)

This is an easy example how to create database migrations with [Flyway](http://flywaydb.org/)

Please note that more information is given in the related blog articles on the topic:
[Managing Database Migrations](https://blog.codecentric.de/en/2017/01/flyway-tutorial-managing-database-migrations/) and [Execute Migrations using Maven](https://blog.codecentric.de/en/2017/01/flyway-tutorial-execute-migrations-using-maven/)

It is based on PostgreSQL database and should run right away after checking it out, if your postgres-server is up and running. 
You might need to add password to the create- and drop-scripts depending on your database configuration for the postgres-user.
Of course you can also easily switch the example to make use of another database by changing JDBC imports and URL.

## Database initialisation

As it is not possible to create a new database with Flyway this needs to be done outside of Flyway. 
The same is true for creating the database user that is used.

### Method 1 : with psql client on existing server

To do this there are two convenience scripts:
* createDatabaseAndUser.sh
* dropDatabaseAndUser.sh

### Method 2 : using Docker

Simply create a container which will create the needed database and user at start.

> docker run -d --name pg-flyway -p 5510:5432 -e POSTGRES_DB="flywaydemo" -e POSTGRES_USER="flywaydemo" -e POSTGRES_PASSWORD="flywaydemo123" postgres:latest

## Execution using Maven

To execute the example just execute the create-script and then you can execute Flyway using Maven. Please take a look at the [POM-file](./pom.xml) to check the Flyway configuration.

> mvn flyway:info

> mvn clean compile flyway:migrate

The Flyway configuration is loaded from the [following order](https://flywaydb.org/documentation/maven/#overriding-order) (system properties first, then env vars, etc.).

If we only want to apply a particular migration (let's say v1.1), we can specify it with :

> mvn flyway:migrate -Dflyway.target=1.1

## Execution using the Command Line Tool

Install the Flyway Command Line Tool according to [these instructions](http://flywaydb.org/documentation/commandline/)

Then execute the following command from the command line. 
The configuration file [flyway.conf](./flyway.conf) contains all the needed configuration for execution from the command line. 
The good thing is that Flyway already comes with JDBC drivers for [a good amount of database systems](http://flywaydb.org/documentation/commandline/) including PostgreSQL. 
Thus there is no need to install anything in addition here.

> flyway migrate
