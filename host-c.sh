export DEBIAN_FRONTEND=noninteractive
#installazione docker + run docker image
#messi prima altrimenti una volta che elimino le rotte di default (interfaccia management)
#non ho più accesso a internet
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
#sudo apt update
sudo apt upgrade
#sudo apt-get install -y docker.io
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
docker pull dustnic82/nginx-test
#docker run dustnic82/nginx-test #credo faccia casino il run (devo killare host-c da oracle vbox)
#docker run --name ngnix-test -p 80:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx
sudo docker run --name nginx-test -p 80:80 -d nginx
#fa partire docker in modalità detached sulla porta 80; nome docker= nginx-test
#--------------------------------------------------------------------------------------------------
# Startup commands go here
ip link set dev enp0s8 up
ip addr add 123.0.1.2/23 dev enp0s8
#Routing
#controllare cosa succede nella tabella di routing
#ip route del default
#ip route add default via 149.11.18.1
#-------------------------------------------------------------------
ip link set dev enp0s8 up
ip addr add 123.0.1.2/25 dev enp0s8
 
ip route del default
ip route add default via 123.0.1.1
