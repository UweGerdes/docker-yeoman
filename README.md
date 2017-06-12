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
$ docker run -it --rm \
	-v $(pwd):/home/node/app \
	uwegerdes/yeoman bash
```

If you started yeoman without `--rm` you may restart and attach to the container (just hit RETURN to get a prompt):

```bash
$ docker start --attach -i yeoman
```

Install a generator with:

```bash
$ cd ${HOME} && \
	cp ${APP_HOME}/package.json . && \
	npm ${NPM_LOGLEVEL} ${NPM_PROXY} --save-dev install generator-generator && \
	cp package.json ${APP_HOME}/ && \
	cd ${APP_HOME}
```

The cp commands make shure that `npm` uses the projects `package.json`. Because `npm` hard replaces `package.json` it cannot use a soft link inside the container.

## Scaffolding

Generate with yeoman with the wizard or use a special subgenerator:

```bash
$ yo generator
$ yo generator:subgenerator <name>
```

## License

[The MIT License](LICENSE.md)
