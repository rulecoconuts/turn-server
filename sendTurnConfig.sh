#!/usr/bin/bash

# This script sends the docker configuration files for this project to the server
# Replace ../virt_digital_ocean_keys/virt_digital_ocean with the path to the private key on your computer
sudo rsync -e "ssh -i ../../virt_digital_ocean_keys/virt_digital_ocean" pullTurnServerImage.sh root@web.testvirt.dev:~/virt_turn/
sudo rsync -e "ssh -i ../../virt_digital_ocean_keys/virt_digital_ocean" runTurnServer.sh root@web.testvirt.dev:~/virt_turn/
sudo rsync -e "ssh -i ../../virt_digital_ocean_keys/virt_digital_ocean" virt-turn-server.conf root@web.testvirt.dev:~/virt_turn/