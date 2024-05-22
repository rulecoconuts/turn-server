#!/usr/bin/bash
docker stop virt_turn
docker container rm virt_turn
docker run -d --network=host \
           -v $(pwd)/virt-turn-server.conf:/etc/coturn/turnserver.conf \
           --name virt_turn coturn/coturn:alpine