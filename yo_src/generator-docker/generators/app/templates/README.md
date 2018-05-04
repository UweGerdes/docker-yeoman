# <%= props.docker %> Dockerfile

## Prerequisites

Make sure you have installed all of the following prerequisites on your development machine:

* Install [Docker](https://docs.docker.com/installation/#installation)

## Build with image

```bash
$ docker build -t uwegerdes/<%= props.docker %> .
```

## connect local project directory to /home/node/app

```bash
$ docker run -it \
	-v $(pwd):/home/node/app \
	--name <%= props.docker %> \
	uwegerdes/<%= props.docker %> bash
```

