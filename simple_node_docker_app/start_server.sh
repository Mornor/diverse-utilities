#!/bin/bash

docker run -it -p 8080:8080 -v $PWD:/usr/src/app -w /usr/src/app  node:8.9.1 bash -c "npm install && npm start"
