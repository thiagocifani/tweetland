Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.host_name = "tweetland"
  config.vm.network "private_network", ip: "10.11.12.13"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/development.yml"
  end
end
