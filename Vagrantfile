Vagrant.configure("2") do |config|
  config.vm.box = "centos6.5"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.proxy.http =ENV['http_proxy']
  config.proxy.https=ENV['https_proxy']
  config.proxy.no_proxy=ENV['no_proxy']
  config.yum_proxy.http     = ENV['http_proxy']
  config.vm.provision "shell", path: "provision.sh", privileged: false
  config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=775', 'fmode=664']
end
