export DEBIAN_FRONTEND=noninteractive

sysctl net.ipv4.ip_forward=1 

# Startup commands go here
#aggiunto ip 10.10.15.2/30 all'interfaccia enp0s9
#sudo ip link set enp0s9 up
#sudo ip add add 10.10.15.2/30 dev enp0s9
#aggiunto ip 172.16.0.0/24 all'interfaccia enp0s8
#sudo ip link set enp0s8 up
#sudo ip add add 149.11.18.1/24 dev enp0s8
#Routing 
#sudo ip route del default
#sudo ip route add default via 10.10.15.1
#-------------------------------------------------------------------
# Set-up the interfaces
sudo ip link set dev enp0s8 up
sudo ip link set dev enp0s9 up
sudo ip addr add 123.0.1.1/23 dev enp0s8 
sudo ip addr add 145.12.1.2/30 dev enp0s9 
#192.168.1.1/24
sudo ip route del default
sudo ip route add default via 145.12.1.1
 
