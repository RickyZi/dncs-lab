export DEBIAN_FRONTEND=noninteractive
# Startup commands go here
#sudo ip link set enp0s8 up
#sudo ip add add 192.168.0.5/23 dev enp0s8
#Routing
#controllare cosa succede nella tabella di routing
#ip route del default
#ip route add default via 149.11.18.1
#-------------------------------------------------------------------
ip link set dev enp0s8 up
ip addr add 123.0.1.2/25 dev enp0s8
 
ip route del default
ip route add default via 123.0.1.1
