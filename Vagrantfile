# -*- mode: ruby -*-

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #
  # Vagrant box.
  #
  config.vm.box = 'trusty'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.hostname = "vagrant.app"

  #
  # Port mapping.
  #
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  #
  # Private network.
  #
  config.vm.network "private_network", ip: "10.10.0.10"

  #
  # Public network.
  #
  # config.vm.network "public_network", ip: "192.168.1.10"

  #
  # Sync folder.
  #
  config.vm.synced_folder "www/", "/var/www/", :owner => "www-data"

  #
  # VM config.
  #
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  #
  # Initial provision sets up zsh.
  #
  config.vm.provision :shell, path: "puppet/provision.sh"

  #
  # Provision with Puppet.
  #
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path = "puppet/modules"
    puppet.options = ["--verbose"]
  end

end
