#!/bin/bash

if [ -d /home/node/yo_src ]; then
	echo "linking generators from yo_src to node_modules"
	ln -f -s /home/node/yo_src/* /home/node/node_modules/
fi

if [ -d /home/node/app/yo_src ]; then
	echo "linking generators from app/yo_src to node_modules"
	ln -f -s /home/node/app/yo_src/* /home/node/node_modules/
fi

if [ ! -w "${APP_HOME}/" ]; then
	echo "ERROR: ${APP_HOME}/ cannot write"
	exit 1
fi

exec "$@"
