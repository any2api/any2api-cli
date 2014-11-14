# any2api-cli

[![Build Status](https://travis-ci.org/any2api/any2api-cli.svg?branch=master)](https://travis-ci.org/any2api/any2api-cli)

Command-line interface for any2api



## Getting started

Prerequisites:

* Node.js >= 0.10
* Ruby (for Chef cookbook scanner)

Install:

    npm install any2api-cli -g

Show help:

    any2api --help

Scan Chef cookbook and generate API spec:

    export COOKBOOK='mysql'
    any2api -o ./mysql-cb scan https://supermarket.getchef.com/cookbooks/$COOKBOOK/download

Generate API implementation:

    any2api -o ./mysql-api-impl gen ./mysql-cb

Prepare runtime for API implementation locally:

    cd ./mysql-api-impl
    npm run prepare-runtime
    
Or build a Docker container to run the API implementation:

    cd ./mysql-api-impl
    docker build -t mysql-api-impl .
    docker run -ti mysql-api-impl bash

Test API implementation (locally or in container):

    npm test

Start API implementation (locally or in container):

    npm start

Or directly run the Docker container (background process):

    docker run -dP mysql-api-impl



## Run any2api-cli inside Docker container

Instead of running any2api-cli locally, you can completely run it in a Docker container:

    docker build -t any2api github.com/any2api/any2api-cli
    docker run -ti any2api



## Available modules

You don't have to install the individual modules manually. When installing any2api-cli, all available modules are shipped automatically.

### Scanners

* [Chef cookbook scanner](https://github.com/any2api/any2api-scanner-chef)
* [Juju charm scanner](https://github.com/any2api/any2api-scanner-juju)
* Docker scanner (planned)
* ...

### Invokers

* [Chef cookbook invoker](https://github.com/any2api/any2api-invoker-chef)
* Juju charm invoker (to be available soon)
* Docker invoker (planned)
* Node.js invoker (planned)
* Ruby invoker (planned)
* Python invoker (planned)
* ...

### Generators

* [REST API generator](https://github.com/any2api/any2api-generator-rest)
* JSON-RPC API generator (to be available soon)
* WSDL/SOAP API generator (planned)
* ...
