# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  config.ssh.forward_x11 = true

  config.vm.network :forwarded_port, guest: 5432, host: 25432

  config.vm.provision :shell, :path => "bootstrap.sh"
end
