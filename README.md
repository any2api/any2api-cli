# any2api-cli

[![Build Status](https://travis-ci.org/any2api/any2api-cli.svg?branch=master)](https://travis-ci.org/any2api/any2api-cli)

Command-line interface for any2api

    npm install any2api-cli -g

Show help:

    any2api --help

Scan Chef cookbook and generate API spec:

    export COOKBOOK='mysql'
    any2api -o ./mysql-cb scan https://supermarket.getchef.com/cookbooks/$COOKBOOK/download

Generate API implementation:

    any2api -o ./impl gen ./mysql-cb

Prepare runtime for API implementation:

    cd ./impl
    npm run prepare-runtime

Test API implementation:

    npm test

Start API implementation:

    npm start

Optional: run any2api inside Docker container:

    docker build -t any2api github.com/any2api/any2api-cli
    docker run -ti any2api
