# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "saucy64"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "phormat"
  end

  config.vm.provision "docker" do |d|
    d.run "carton",
      cmd: "bash -l",
      args: "-v '/vagrant:/var/www'"
  end
  
  config.vm.synced_folder "../tools", "/tools"
  config.vm.synced_folder "src/templates", "/pht"

 end
