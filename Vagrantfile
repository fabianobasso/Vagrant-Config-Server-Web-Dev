Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/focal64"
 	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 1
		v.name = "BassoSystem"
	end
  	config.vm.hostname = "scooby"
        #config.vm.network "public_network", bridge: "wlp6s0", ip: "10.10.1.70", hostname: true
        config.vm.network "public_network", bridge: "enp7s0", ip: "10.10.1.71", hostname: true    
    	config.vm.synced_folder "app/", "/home/vagrant/app"
        config.vm.provision "shell", path: "configServer/configServer.sh"	
	config.disksize.size = "50GB"  	
end
