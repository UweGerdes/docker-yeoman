# Build:
# docker build -t uwegerdes/yeoman .

FROM uwegerdes/nodejs
MAINTAINER Uwe Gerdes <entwicklung@uwegerdes.de>

ENV USER_NAME node
ENV NODE_HOME /home/${USER_NAME}
ENV NODE_PATH ${NODE_HOME}/node_modules:/usr/lib/node_modules
ENV APP_HOME ${NODE_HOME}/app

# Set development environment as default
ENV NODE_ENV development

USER root

COPY package.json ${NODE_HOME}/

# Install node.js environment
RUN mkdir -p ${APP_HOME} && \
	chown -R ${USER_NAME}:${USER_NAME} ${APP_HOME} && \
	chown -R ${USER_NAME}:${USER_NAME} ${NODE_HOME}/package.json && \
	npm install -g \
				eslint \
				jest-cli \
				nsp \
				yo && \
	npm cache clean

# reduce rights
USER ${USER_NAME}

# set HOME
ENV HOME ${NODE_HOME}

# Install node_modules in ${NODE_PATH}
WORKDIR ${NODE_HOME}
RUN npm install && \
	npm cache clean

WORKDIR ${APP_HOME}

CMD ln -f -s /home/node/yo_src/* /home/node/node_modules/ && bash
