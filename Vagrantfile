# Specify a custom Vagrant box for the demo
DEMO_BOX_NAME = ENV['DEMO_BOX_NAME'] || "martinhristov90/consul"

# Vagrantfile API/syntax version.
# NB: Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# IP address scheme server nodes - name: server_node_[1] = IP: 172.20.20.1[1]
# IP address scheme client nodes - name: client_node_[1] = IP: 172.20.20.2[1]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = DEMO_BOX_NAME
  config.vm.box_download_insecure = true
#   config.vm.provision "shell",
                        #   inline: $script,
                        #   env: {'CONSUL_DEMO_VERSION' => CONSUL_DEMO_VERSION}

  config.vm.define "server-node-1" do |n1|
      n1.vm.hostname = "server-node-1"
      n1.vm.network "private_network", ip: "172.20.20.11"
      n1.vm.network "forwarded_port", guest: 8500, host: 8500
      
  end

  config.vm.define "server-node-2" do |n2|
      n2.vm.hostname = "server-node-2"
      n2.vm.network "private_network", ip: "172.20.20.12"
  end

  config.vm.define "server-node-3" do |n3|
      n3.vm.hostname = "server-node-3"
      n3.vm.network "private_network", ip: "172.20.20.13"
  end

  (1..2).each do |i|
  config.vm.define "client-node-#{i}" do |client|
      client.vm.hostname = "client-node-#{i}"
      client.vm.network "private_network", ip: "172.20.20.2#{i}"
   end

  end
  
end