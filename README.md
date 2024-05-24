# turn-server
Easily configurable and deployable TURN/STUN Server container for peer-to-peer connections

## Deployment
To deploy a TURN/STUN server using this tool, all you need to do is pass your desired environment variables to the container:

```shell
docker run --env-file ./.env --network=host coconutsrule/turn-server:latest
```

To run it in a compose file, use the following format as a guide:

```yaml
version: '3.7'

services:
  turn-server:
    image: 'coconutsrule/turn-server:latest'
    container_name: turn-server
    network_mode: 'host'
    environment:
      - TURN_SERVER_NAME=localhost
      - TURN_EXTERNAL_IP=127.0.0.1

```

The only necessary environment variables are <strong>TURN_SERVER_NAME</strong> and <strong>TURN_EXTERNAL_IP</strong>.

## Environment Variables

| Name                     | Description                                                                                                     |
|--------------------------|-----------------------------------------------------------------------------------------------------------------|
| TURN_SERVER_NAME         | Server name used for the oAuth authentication purposes                                                          |
| TURN_REALM               | The default realm to be used for the users when no explicit origin/realm relationship was found in the database |
| TURN_EXTERNAL_IP         | TURN Server public/private address mapping, if the server is behind NAT                                         |
| TURN_MAIN_LISTENING_PORT | Main port to listen for data                                                                                    |
| TURN_MIN_PORT            | Lower bound of the UDP port range for relay endpoints allocation. Default value is 49152                        |
| TURN_MAX_PORT            | Upper bound of the UDP port range for relay endpoints allocation. Default value is 65535                        |
| TURN_USER                | Long-term credentials user account, in the column-separated form 'username:key'                                 |