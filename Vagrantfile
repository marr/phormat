# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    
    config.vm.box = "phusion-open-ubuntu-12.04-amd64"

    config.vm.provision "docker",
        images: ["phusion/baseimage"]
    
    config.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
        chef.add_recipe "phormat"
    end

    config.vm.synced_folder "src/", "/srv/myapp"
    config.vm.synced_folder "src/chef-plenv/", "/vagrant/chefrepo"
end
