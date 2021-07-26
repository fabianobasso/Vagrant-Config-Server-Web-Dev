Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/focal64"
 	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 1
		v.name = "WebServer"
	end
  	config.vm.hostname = "devServerWeb"
        config.vm.network "public_network", bridge: "<interface>", ip: "<ip>", hostname: true    
    	config.vm.synced_folder "app/", "/home/vagrant/app"
        config.vm.provision "shell", path: "configServer/configServer.sh"	
	config.disksize.size = "50GB"  	
end
