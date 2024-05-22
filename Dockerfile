FROM bash:5.2.15-alpine3.18

WORKDIR /turn
COPY generateTurnConf.sh runTurnMainProcess.sh turnserver.t.conf ./
RUN apk add --no-cache coturn gettext

# generate turn server configuration file from environment variables

ENTRYPOINT [ "/usr/local/bin/bash", "runTurnMainProcess.sh"]