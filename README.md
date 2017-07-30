# Yeoman Dockerfile

Yeoman wrapped in a Dockerfile to use it in different projects for my environment:

* my baseimage-nodejs
* dockered apt-cacher-ng and npm-proxy-cache
* node_modules outside project directory

## Prerequisites

Make sure you have installed all of the following prerequisites on your development machine:

* Install [Docker](https://docs.docker.com/installation/#installation)

### Local development and testing with compose (still experimental):

This should start up an environment for scaffolding with Yeoman.

## Build with uwegerdes/nodejs image

```bash
$ docker build -t uwegerdes/yeoman .
```

### connect local project directory to /home/node/app

```bash
$ docker run -it \
	-v $(pwd):/home/node/app \
	--name yeoman \
	uwegerdes/yeoman bash
```

Install a generator with:

```bash
$ cd ${HOME} && \
	npm ${NPM_LOGLEVEL} ${NPM_PROXY} --save-dev install generator-generator && \
	cd ${APP_HOME}
```

The `package.json` for the Dockerfile should be used - so you can rebuild a full blown yeoman generator collection.

If you will want to restart and attach to the container (just hit RETURN to get a prompt):

```bash
$ docker start --attach -i yeoman
```

You can also docker commit the container to have the generators ready for a new container.

## Scaffolding

Generate with yeoman with the wizard or use a special subgenerator:

```bash
$ yo generator
$ yo generator:subgenerator <name>
```

## Using your generator templates

If you have templates for Yeoman you can link that directory as a volume and the yo command will find it.

Please go to your project base directory and run the container with:

```bash
$ docker run -it \
	-v ~/Projekte/publish/yeoman/yo_src:/home/node/yo_src \
	-v $(pwd):/home/node/app \
	--name yeoman \
	uwegerdes/yeoman
```

## Generator development support

Start another bash in a running container:

```bash
$ docker exec -it yeoman bash
$ cd /home/node/yo_src/generator-tle
$ npm test
```

TODO: For your convenience a gulpfile is provided for checking the the generators directory.

## License

[The MIT License](LICENSE.md)
