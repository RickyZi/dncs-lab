# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  #test docker
  #----------------------------------------------------------------
  #config.vm.hostname="docker-host"
  #config.ssh.insert_key=false
  #config.vm.box="ubuntu/bionic64"
  #config.vm.provision "docker"
  #config.vm.synced_folder "." "/vagrant", disable: true
  #config.vm.provider "docker" do |docker|
  #    docker.vagrant_vagrantfile = "host-c/Vagrantfile"
  #    docker.image = "dustnic82/nginx-test"
  #    docker.ports = ['80:80', '443:443']
   #   docker.name = 'nginx-container'
  #end
  
  
  #config.vm.network :forwarded_port, guest: 80, host: 80
  
  #config.vm.provider "docker" do |docker|
    # docker.vagrant_vagrantfile = "host-c/Vagrantfile"
    #docker.image = "dustnic82/nginx-test"
    #docker.ports = ['80:80']
    #docker.name = 'nginx-container'
  #end 
  #----------------------------------------------------------------
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "off"]
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc5", "allow-all"]

    #config.vm.network "private-network" , ip:"192.168.10.101"
    #provare a spostare nell'host-c ?

    vb.cpus = 1
  end

  

  config.vm.define "router-1" do |router1|
    router1.vm.box = "ubuntu/bionic64"
    router1.vm.hostname = "router-1"
    router1.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-1", auto_config: false
    router1.vm.network "private_network", virtualbox__intnet: "broadcast_router-inter", auto_config: false
    router1.vm.provision "shell", path: "router-1.sh", run: 'always'
      router1.vm.provider "virtualbox" do |vb|
        vb.memory = 256
      end
  end

  config.vm.define "router-2" do |router2|
    router2.vm.box = "ubuntu/bionic64"
    router2.vm.hostname = "router-2"
    router2.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-2", auto_config: false
    router2.vm.network "private_network", virtualbox__intnet: "broadcast_router-inter", auto_config: false
    router2.vm.provision "shell", path: "router-2.sh", run: 'always'
      router2.vm.provider "virtualbox" do |vb|
        vb.memory = 256
      end
  end

  config.vm.define "switch" do |switch|
    switch.vm.box = "ubuntu/bionic64"
    switch.vm.hostname = "switch"
    switch.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-1", auto_config: false
    switch.vm.network "private_network", virtualbox__intnet: "broadcast_host_a", auto_config: false
    switch.vm.network "private_network", virtualbox__intnet: "broadcast_host_b", auto_config: false
    switch.vm.provision "shell", path: "switch.sh", run: 'always'
      switch.vm.provider "virtualbox" do |vb|
        vb.memory = 256
      end
  end
  config.vm.define "host-a" do |hosta|
    hosta.vm.box = "ubuntu/bionic64"
    hosta.vm.hostname = "host-a"
    hosta.vm.network "private_network", virtualbox__intnet: "broadcast_host_a", auto_config: false
    #hosta.vm.network: forwarded_port, host: 2204, guest: 22
    hosta.vm.provision "shell", path: "host-a.sh", run: 'always'
      hosta.vm.provider "virtualbox" do |vb|
        #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        #vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        vb.memory = 256
      end
  end

  config.vm.define "host-b" do |hostb|
    hostb.vm.box = "ubuntu/bionic64"
    hostb.vm.hostname = "host-b"
    hostb.vm.network "private_network", virtualbox__intnet: "broadcast_host_b", auto_config: false
    #hostb.vm.network :public_network
    hostb.vm.network :forwarded_port, host: 2204, guest: 22
    hostb.vm.provision "shell", path: "host-b.sh", run: 'always'
      hostb.vm.provider "virtualbox" do |vb|
        vb.memory = 256
      end
  end

  config.vm.define "host-c" do |hostc|
    hostc.vm.box = "ubuntu/bionic64"
    hostc.vm.hostname = "host-c"
    hostc.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-2", auto_config: false
    
    #config.vm.network :forwarded_port, guest: 80, host: 80
    #config.vm.network :forwarded_port, guest: 80, host: 4567
    #config.vm.network "private_network", ip: "192.168.10.101"
    
    hostc.vm.provision "shell", path: "host-c.sh", run: 'always'
    #hostc.vm.provision "shell", path: "host-c_docker.sh", run: 'always'


      hostc.vm.provider "virtualbox" do |vb|
        vb.memory = 512 #doppia memoria altrimenti fa casino
      end
      #hostc.vm.provider "docker" do |docker|
      #  docker.pull_images "dustnic82/nginx-test"
      #  docker.run "dustnic82/nginx-test"
      #  docker.ports = ['80:80']
      #  docker.name = 'nginx-container'
      #end
        #connessione internet vbox
        #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        #vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        #modificare il vgrant file per attivare docker
        #hostc.vm.provider "docker" do |docker|
        ##  docker.pull_images "dustnic82/nginx-test"
        # docker.run "dustnic82/nginx-test" 
        #end
        #config.vm.provision "shell", inline: <<-SHELL
        #wget -qO- https://get.docker.com/ | s
        #SHELL
        #end
  end
end
