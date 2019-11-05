export DEBIAN_FRONTEND=noninteractive
# Startup commands go here
#sudo ip link set enp0s8 up
#sudo ip add add 172.16.1.10/24 dev enp0s8
#aggiunta rotta statica per raggiungere interfaccia .20 del router per raggiungere host-a
#sudo ip route add 172.16.0.0/26 via 172.16.1.1 dev enp0s8
#sudo ip route del default
#sudo ip route add default via 172.16.1.1
#-------------------------------------------------------------------

sudo ip link set dev enp0s8 up
sudo ip add add 145.11.1.1/24 dev enp0s8 
#sudo ip link set dev enp0s9.20 up
sudo ip route del default
sudo ip route add default via 145.11.1.2
