export DEBIAN_FRONTEND=noninteractive
# Startup commands go here

sysctl net.ipv4.ip_forward=1 #per essere sicuro che kernel invii pacchetti = 1 attivo

#sudo ip link set enp0s8 up #attivo interfaccia fra router e switch
#create sotto-interfacce per collegamento alle VLAN 10 e 20 degli host A e B
#sudo ip link add link enp0s8 name enp0s8.10 type vlan id 10
#sudo ip link add link enp0s8 name enp0s8.20 type vlan id 20
#sudo ip link set enp0s8.10 up
#sudo ip link set enp0s8.20 up
#sudo ip add add 172.16.0.1/26 dev enp0s8.10 #impostato DG per VLAN 10
#sudo ip add add 172.16.1.1/24 dev enp0s8.20 #impostato DG per VLAN 20
#--------------------------------------------------------------------------
#per eliminare sotto-interfaccia VLAN
#sudo ip link set dev enp0s8.10 down stessa cosa per .20
#per eliminare vlan
#ip link set dev enp0s8.10 down
#ip link delete enp0s8.10
#--------------------------------------------------------------------------
#aggiunto ip 10.10.15.1/30 all'interfaccia enp0s9
#sudo ip link set enp0s9 up
#sudo ip add add 10.10.15.1/30 dev enp0s9
#--------------------------------------------------------------------------
#per eliminare ip primario sudo ifconfig enp0s9 0 (in queso caso mi ha tolto l'indirizzio 172.16.0.0/24)
#adesso ha solo l'indirizzo 10.10.15.1/30
#--------------------------------------------------------------------------

#Routing
#sudo ip route del default
#sudo ip route add 192.168.0.5 via 10.10.15.2
#-------------------------------------------------------------------
sudo ip link add link enp0s8 name enp0s8.10 type vlan id 10
sudo ip link add link enp0s8 name enp0s8.20 type vlan id 20
sudo ip link set dev enp0s8 up
sudo ip link set dev enp0s9 up
sudo ip link set dev enp0s8.10 up
sudo ip link set dev enp0s8.20 up
 
sudo ip addr add 145.10.1.2/23 dev enp0s8.10
sudo ip addr add 145.11.1.2/24 dev enp0s8.20
sudo ip addr add 145.12.1.1/30 dev enp0s9
 
#routing
sudo ip route del default
sudo ip route add 123.0.1.2 via 145.12.1.2 
