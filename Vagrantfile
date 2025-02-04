Vagrant.configure("2") do |config|

  # Define the first VM
  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "eurolinux-vagrant/centos-stream-9"
    vm1.vm.network "private_network", ip: "192.168.45.11"

    # Use VirtualBox as the provider
    vm1.vm.provider "virtualbox" do |v|
      v.memory = "600"
      v.cpus = "2"
    end
  end

  # Define the second VM
  config.vm.define "vm2" do |vm2|
    vm2.vm.box = "eurolinux-vagrant/centos-stream-9"
    vm2.vm.network "private_network", ip: "192.168.45.12"

    # Use VirtualBox as the provider
    vm2.vm.provider "virtualbox" do |v|
      v.memory = "600"
      v.cpus = "2"
    end
  end

end
