#
# Dockerfile for yeoman
#
# docker build -t uwegerdes/yeoman .

FROM uwegerdes/nodejs
MAINTAINER Uwe Gerdes <entwicklung@uwegerdes.de>

USER root

COPY . ${APP_HOME}/

WORKDIR ${NODE_HOME}

COPY package.json ${NODE_HOME}/

RUN npm install -g \
				yo && \
	npm install && \
	chown -R ${USER_NAME}:${USER_NAME} ${NODE_HOME}

COPY entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

USER ${USER_NAME}

WORKDIR ${APP_HOME}

CMD bash

