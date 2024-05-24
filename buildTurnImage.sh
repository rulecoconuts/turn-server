sudo docker-compose down;
sudo docker image build -t coconutsrule/turn-server:latest .;
sudo docker push coconutsrule/turn-server:latest;

sudo docker-compose pull;
sudo docker-compose up -d;
sudo docker logs -f turn-server;