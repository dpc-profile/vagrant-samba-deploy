# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.network :private_network, :ip => "10.10.10.11"
  config.vm.provision "shell", path: "sambaInit.sh"
end
