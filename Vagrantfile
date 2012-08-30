Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network :hostonly, "33.33.33.33"
  config.vm.forward_port 3000, 3000
  
  config.vm.share_folder "webapp", "/opt/webapp", "source"

  config.vm.customize do |vm|
    vm.name = "Garden Cookbook"
    vm.memory_size = 1024
  end
  
  #What this does is it goes into the application folder in cookbooks folder and runs the default.rb
  # Recipe thing
  config.vm.provision :chef_solo, :run_list => ["recipe[application]"] do |chef|
    chef.json.merge!({
      :ruby  => { :version  => "1.9.3" },
      :rails => { :app_name => "garden_cookbook",
                  :version  => "3.2.3",
                  :db_type  => "postgresql" }
    })
  end
end
