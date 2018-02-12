Vagrant.require_version ">= 1.7.4"

HOSTS = [
    { :name => "ansible01", :ip => "10.0.0.41", :cpus => "1",
      :mem => "2048"  , :box => "bento/ubuntu-16.04",
      #:ports => [ { :guest => 27017, :host => 7379 } ]
    },
]


Vagrant.configure(2) do |config|
    
    HOSTS.each do |opts|
        config.vm.define opts[:name] do |node|

            node.vm.hostname = opts[:name]
            node.vm.box      = opts[:box]
            node.vm.synced_folder "./data", "/vagrant_data"

            node.vm.network "private_network", ip: opts[:ip]
            if (opts.has_key?(:ports))
                opts[:ports].each do |port|
                    node.vm.network "forwarded_port",
                        guest: port[:guest], host: port[:host]
                end
            end

            node.vm.network "public_network", :bridge => 'wlp1s0'			

            node.vm.provider "virtualbox" do |vb|
                vb.name = opts[:name]
                vb.customize ["modifyvm", :id, "--memory", opts[:mem]]
				vb.customize ["modifyvm", :id, "--cpus", opts[:cpus]]
            end
            
            #node.vm.provision "shell", inline: <<-SHELL
            #    sudo apt-get update
            #SHELL
            config.vm.provision "ansible" do |ansible|
                ansible.playbook = "playbook.yml"
            end  

        end

    end

end
