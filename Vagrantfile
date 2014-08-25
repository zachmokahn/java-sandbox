# -*- mode: ruby -*-
# vi: set filetype=ruby :

VERSION = '2'
BOX = 'precise64'
BOX_IP = '192.168.50.4'

Vagrant.configure(VERSION) do |config|
  config.vm.box = BOX

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  # Tons of Ports Forwarded because Yolo
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.network :forwarded_port, guest: 5432, host: 5432
  config.vm.network :forwarded_port, guest: 7990, host: 7990
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # Set IP of the Box for Sharing Keys
  # * run this in your shell to allow the box to share your keys
  #     $ echo "Host #{BOX_IP}\n\tForwardAgent yes\n" > .ssh/config
  config.vm.network 'private_network', ip: BOX_IP
  config.ssh.forward_agent = true

  # Folder Shared between Machines
  config.vm.synced_folder 'apps/', '/home/vagrant/apps', :create => true

  # apt-get doesn't works without updating apt-get, thanks precise64
  config.vm.provision 'shell', inline: 'apt-get update --fix-missing'

  # Puppet Provisioning... because it helps with configuration
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file  = 'base.pp'
    puppet.module_path = 'puppet/modules'
    # puppet.options = '--verbose' # Debugging Module Additions
  end

  # Shell Provisioning... because sometimes it's just better
  config.vm.provision :shell, :path => 'bash/elasticsearch'
  config.vm.provision :shell, :path => 'bash/dotfiles'
  config.vm.provision :shell, :path => 'bash/ag'
  config.vm.provision :shell, :path => 'bash/eclim'
end
