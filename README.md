# Yeoman Dockerfile [![Build Status](https://travis-ci.org/UweGerdes/docker-yeoman.svg?branch=master)](https://travis-ci.org/UweGerdes/docker-yeoman)

Yeoman wrapped in a Dockerfile to use it in different projects for my environment.

## Prerequisites

Make sure you have installed all of the following prerequisites on your development machine:

* Install [Docker](https://docs.docker.com/installation/#installation)

### Local development and testing with compose (still experimental):

This should start up an environment for scaffolding with Yeoman.

## Build

```bash
$ docker build -t uwegerdes/yeoman .
```

### Run

Start container in your project directory (with own generators in subdirectory `yo_src`) and another directory with generators:

```bash
$ docker run -it \
	-v /home/user/some/directory/with/yo_src:/home/node/yo_src \
	-v $(pwd):/home/node/app \
	--name project-yeoman \
	uwegerdes/yeoman bash
```

Generators from `/home/node/yo_src` and `/home/node/app/yo_src` are linked to `/home/node/node_modules` and should be available for `yo`.

Install a generator (--save in projects package.json) with:

```bash
$ npmisd generator-generator
```

This command uses a small script that copies

The `package.json` in your working directory (linked to /home/node/app) is used - so you can rebuild a full blown yeoman generator collection.

If you will want to restart and attach to the container (just hit RETURN to get a prompt):

```bash
$ docker start -ai yeoman
```

You can also docker commit the container to have the generators ready for a new container.

## Scaffolding

Generate with yeoman with the wizard or use a special subgenerator:

```bash
$ yo generator
$ yo generator:subgenerator <name>
```

The package `generator-generator` is installed for your convenience.

## Using your generator templates

If you have templates for Yeoman you can link that directory as a volume and the yo command will find it.

Please go to your project base directory and run the container with:

```bash
$ docker run -it --rm \
	-v ~/projekts/yeoman/yo_src:/home/node/yo_src \
	-v $(pwd):/home/node/app \
	--name yeoman \
	uwegerdes/yeoman
```

## Testing your generator templates

To execute tests for your developing generator use:

```bash
$ docker run -it --rm \
	-v ~/projekts/yeoman/yo_src:/home/node/yo_src \
	-v $(pwd):/home/node/app \
	--name yeoman \
	uwegerdes/yeoman bash
node@docker$ cd yo_src/generator-mygenerator
node@docker$ npm test
```

## Generator development support

Start another bash in a running container:

```bash
$ docker exec -it yeoman bash
$ cd /home/node/yo_src/generator-tle
$ npm test
```

## License

[The MIT License](LICENSE.md)

