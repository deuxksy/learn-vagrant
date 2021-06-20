# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant_API_Version ="2"

Vagrant.configure(Vagrant_API_Version) do |config|

  config.vm.define "rs-master" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |v|
      v.name = "rs-master"
      v.memory = 4096
      v.cpus = 2
    end
    # cfg.vm.disk :disk, size: "16GB", primary: true
    cfg.vm.hostname = "rs-master"
    cfg.vm.provision "shell", path: "bootstrap.sh"
    cfg.vm.network "public_network", ip: "192.168.3.81", bridge: "eno1"
  end

  config.vm.define "rs-node01" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |v|
      v.name = "rs-node01"
      v.memory = 2048
      v.cpus = 2
    end
    # cfg.vm.disk :disk, size: "8GB", primary: true
    cfg.vm.hostname = "rs-node01"
    cfg.vm.provision "shell", path: "bootstrap.sh"
    cfg.vm.network "public_network", ip: "192.168.3.91", bridge: "eno1"
  end

  config.vm.define "rs-node02" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |v|
      v.name = "rs-node02"
      v.memory = 2048
      v.cpus = 2
    end
    # cfg.vm.disk :disk, size: "8GB", primary: true
    cfg.vm.hostname = "rs-node02"
    cfg.vm.provision "shell", path: "bootstrap.sh"
    cfg.vm.network "public_network", ip: "192.168.3.92", bridge: "eno1"
  end

  config.vm.define "rs-node03" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |v|
      v.name = "rs-node03"
      v.memory = 2048
      v.cpus = 2
    end
    # cfg.vm.disk :disk, size: "8GB", primary: true
    cfg.vm.hostname = "rs-node03"
    cfg.vm.provision "shell", path: "bootstrap.sh"
    cfg.vm.network "public_network", ip: "192.168.3.93", bridge: "eno1"
  end

end