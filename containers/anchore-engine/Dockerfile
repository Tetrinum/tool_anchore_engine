FROM docker.io/anchore/anchore-engine:latest

ENV ARCHORE_ENGINE_HOME=/src/anchore-engine \
	ANCHORE_HOST_ID=dockerhostid-anchore-engine \
	ANCHORE_ENDPOINT_HOSTNAME=anchore-engine

WORKDIR $ARCHORE_ENGINE_HOME/

EXPOSE 8228 8338

COPY ./config/* $ARCHORE_ENGINE_HOME/config/
