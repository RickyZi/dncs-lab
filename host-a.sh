export DEBIAN_FRONTEND=noninteractive
# Startup commands go here (host-a)
#sudo ip link set enp0s8 up
#sudo ip add add 172.16.0.54/26 dev enp0s8
#aggiunta rotta statica per raggiungere host-b attraverso router
#sudo ip route add 172.16.1.0/24 via 172.16.0.1 dev enp0s8
#devo mettere 172.16.0.54?
#sudo ip route del default
#sudo ip route add default via 172.16.0.1
#-------------------------------------------------------------------
#versione casa
#aggiungo la porta all'host a con il tag vlan 10
sudo ip link set dev enp0s8 up
#sudo ip link add link enp0s8 name enp0s8.10 type vlan id 10
sudo ip add add 145.10.1.1/26 dev enp0s8
#sudo ip link set dev enp0s8.10 up
sudo ip route del default
sudo ip route add default via 145.10.1.2