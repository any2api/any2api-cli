VAGRANTFILE_API_VERSION = "2"

if ENV['VAGRANT_BOX'].nil?
  ENV['VAGRANT_BOX'] = "ubuntu/trusty64" # "phusion/ubuntu-14.04-amd64" # "chef/ubuntu-14.04"
end

Vagrant.require_version ">= 1.6.5"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = ENV['VAGRANT_BOX']
  config.vm.box_check_update = true

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provider "vmware_fusion" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provision :shell do |s|
    s.inline = <<-EOT
      #sudo echo "Europe/Berlin" | sudo tee /etc/timezone
      sudo dpkg-reconfigure -f noninteractive tzdata

      sudo /usr/local/bin/ntpclient -s -h pool.ntp.org

      ssh-keyscan github.com >> ~/.ssh/known_hosts

      sudo apt-get update -y
      sudo apt-get install -y build-essential curl git libssl-dev man ruby nano

      git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
      echo "source ~/.nvm/nvm.sh" >> ~/.profile
      source ~/.profile

      nvm install 0.10
      nvm alias default 0.10

      npm install any2api-cli -g

      any2api install scanner all
      any2api install invoker all
      any2api install generator all
    EOT
    s.privileged = false
  end
end
