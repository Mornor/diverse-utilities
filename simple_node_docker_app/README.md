This file aims at explaining how this project works.
Basic knowledge of Linux and Node.JS are required.

1. General explanations about Docker <br/>
Even though this is [false](https://stackoverflow.com/questions/16047306/how-is-docker-different-from-a-normal-virtual-machine), Docker can be seen a small custom VM.
You can pack every dependencies needed into a Docker container, and then run this Docker container directly on a machine. The only requirement is that Docker has to be installed on the machine.

2. Explanations about this project itself <br/>
This project expose an HTML file from a Node.JS server, which also connects to a PostrgreSQL database. The whole application is Dockerized.
I won't spend time explaining the Node.JS code, as I think it is quite small and obvious to be understood.

To build the Docker container, simply issue `docker build -t [NAME] .`. This will fetch all dependencies from `packages.json` and start the Node.JS `server.js`. The content served by the server can then be accessed via `http://localhost:8080/`

If, instead of creating a Docker container you wish to work in real-time on the Node.JS itself, just run `./start_server.sh`. From there, any changes in the code can be seen after refreshing `http://localhost:8080/`.
