# any2api-cli

[![Build Status](https://travis-ci.org/any2api/any2api-cli.svg?branch=master)](https://travis-ci.org/any2api/any2api-cli)

Command-line interface for any2api



## About

Use **any2api** to wrap arbitrary executables (scripts, Chef cookbooks, Juju charms, compiled programs, etc.) by auto-generating containerized API implementations. This is to ease integration and orchestration of different kinds of executables, e.g., to implement fully automated deployment processes.

It's a fully modular and extensible framework. Modules are shipped as [npm modules](https://www.npmjs.org/browse/keyword/any2api), but not all of them have to be implemented in JavaScript/Node. Currently, [any2api-cli](https://github.com/any2api/any2api-cli) provides a command-line interface; a web-based user interface is planned.



## Getting started

Prerequisites:

* Node.js >= 0.10
* Ruby (for any2api-scanner-chef)
* Optional: Docker (if you want to run generated APIs in a container)
* Optional: Vagrant (if you want to run generated APIs in a dedicated VM)

Install any2api-cli using npm:

    npm install any2api-cli -g

Install all available modules, i.e., scanners, invokers, and generators:

    any2api install scanner all
    any2api install invoker all
    any2api install generator all

Show help:

    any2api --help

Scan Chef cookbook and generate API spec:

    export COOKBOOK='mysql'
    export VERSION='5.6.1'
    any2api -o ./mysql-cb scan https://supermarket.chef.io/cookbooks/$COOKBOOK/versions/$VERSION/download

Generate API implementation:

    any2api -o ./mysql-api-impl gen ./mysql-cb

Prepare runtime for API implementation locally:

    cd ./mysql-api-impl
    npm run prepare-runtime
    
Or build a Docker container to run the API implementation:

    cd ./mysql-api-impl
    docker build -t mysql-api-impl .
    docker run -tiP mysql-api-impl bash

Test API implementation (locally or in container):

    npm test

Start API implementation (locally or in container):

    npm start

Or directly run the Docker container:

    docker run -dP mysql-api-impl

The container is now running as a background process.

Alternatively, you can use Vagrant:

    vagrant up

The API implementation is now running in a dedicated virtual machine.



## Run any2api-cli inside Docker container

Instead of running any2api-cli locally, you can run it in a Docker container (prebuilt):

    docker run -ti any2api/any2api-cli

Alternatively, you may build a fresh container and run it:

    docker build -t any2api/any2api-cli github.com/any2api/any2api-cli
    docker run -ti any2api/any2api-cli

With this everything runs safely in an isolated container.



## Run any2api-cli using Vagrant

Yet another way to run any2api-cli is using Vagrant. After cloning the [any2api-cli](https://github.com/any2api/any2api-cli) repository, run the following commands:

    vagrant up
    vagrant ssh

From now everything runs safely in a dedicated virtual machine.



## Available modules

### Scanners

* [any2api-scanner-chef](https://github.com/any2api/any2api-scanner-chef) - *scan Chef cookbooks*
* [any2api-scanner-juju](https://github.com/any2api/any2api-scanner-juju) - *scan Juju charms*
* any2api-scanner-docker - *scan Docker container images and Dockerfiles (planned)*
* ...

### Invokers

* [any2api-invoker-chef](https://github.com/any2api/any2api-invoker-chef) - *invoke Chef cookbooks*
* any2api-invoker-juju - *invoke Juju charm (to be available soon)*
* any2api-invoker-docker - *run Docker containers (planned)*
* any2api-invoker-node - *invoke Node modules (planned)*
* any2api-invoker-ruby - *invoke Ruby scripts (planned)*
* any2api-invoker-python - *invoke Python scripts (planned)*
* ...

### Generators

* [any2api-generator-rest](https://github.com/any2api/any2api-generator-rest) - *generate REST API implementations based on Node.js or Java*
* any2api-generator-jsonrpc - *generate JSON-RPC API implementations (to be available soon)*
* any2api-generator-soap - *generate WSDL/SOAP API implementations (planned)*
* ...
