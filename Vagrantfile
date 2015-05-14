VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "swarm" do |server|
    server.vm.box = "ubuntu/trusty64"
    server.vm.host_name = 'swarm'
    server.vm.network "forwarded_port", guest: 4567, host: 4567
    server.vm.network "private_network", ip: "172.16.3.101"
    server.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules"]
      puppet.manifest_file = "swarm.pp"
    end
  end #server

  config.vm.define "node1" do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.host_name = 'node1'
    node.vm.network "private_network", ip: "172.16.3.102"
    node.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
    node.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules"]
      puppet.manifest_file = "node.pp"
    end
  end #node

  config.vm.define "node2" do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.host_name = 'node2'
    node.vm.network "private_network", ip: "172.16.3.103"
    node.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
    node.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules"]
      puppet.manifest_file = "node.pp"
    end
  end #node

end
