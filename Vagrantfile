# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant_API_Version ="2"

Vagrant.configure(Vagrant_API_Version) do |config|

  config.vm.define "master" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |v|
      v.name = "master"
      v.memory = 4096
      v.cpus = 2
    end
    # cfg.vm.disk :disk, size: "16GB", primary: true
    cfg.vm.hostname = "master"
    cfg.vm.provision "shell", path: "./shell/bootstrap-all.sh"
    cfg.vm.provision "shell", path: "./shell/bootstrap-master.sh"
    cfg.vm.network "public_network", ip: "192.168.1.81", bridge: "Realtek PCIe GBE Family Controller #2"
    # cfg.vm.network "private_network", ip: "192.168.1.81", bridge: "Realtek PCIe GBE Family Controller #2"
  end

  config.vm.define "node1" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |v|
      v.name = "node1"
      v.memory = 2048
      v.cpus = 2
    end
    cfg.vm.hostname = "node1"
    cfg.vm.provision "shell", path: "./shell/bootstrap-all.sh"
    cfg.vm.provision "shell", path: "./shell/bootstrap-node.sh"
    cfg.vm.network "public_network", ip: "192.168.1.91", bridge: "Realtek PCIe GBE Family Controller #2"
    # cfg.vm.network "private_network", ip: "192.168.1.91", bridge: "Realtek PCIe GBE Family Controller #2"
  end

  config.vm.define "node2" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |v|
      v.name = "node2"
      v.memory = 2048
      v.cpus = 2
    end
    cfg.vm.hostname = "node2"
    cfg.vm.provision "shell", path: "./shell/bootstrap-all.sh"
    cfg.vm.provision "shell", path: "./shell/bootstrap-node.sh"
    cfg.vm.network "public_network", ip: "192.168.1.92", bridge: "enp0s3: Realtek PCIe GBE Family Controller #2"
  end

  # config.vm.define "node3" do |cfg|
  #   cfg.vm.box = "ubuntu/focal64"
  #   cfg.vm.provider "virtualbox" do |v|
  #     v.name = "node3"
  #     v.memory = 2048
  #     v.cpus = 2
  #   end
  #   cfg.vm.hostname = "node3"
  #   cfg.vm.provision "shell", path: "./shell/bootstrap-all.sh"
  #   cfg.vm.provision "shell", path: "./shell/bootstrap-node.sh"
  #   cfg.vm.network "public_network", ip: "192.168.1.93", bridge: "enp0s3"
  # end

end