#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2012, Oversun-Scalaxy LTD
#

# Installing required git core-packages
package 'git-core' do
  action :install
  options '--force-yes'
end

# Retrieving admins collection
#admins = data_bag("admins")

## admins list round-trip
#admins.each do |login|
#  admin = data_bag_item("admins", login)
#  home = "/home/#{login}"
#  
#  # Exporting files only if user realy wants to
#  if admin['dotfiles']['enabled_standard']
#    # Exporting standard dotfiles only if home_directory exists 
#    log "[dotfiles] Uploading STANDARD dotfiles for #{admin} from #{node['dotfiles']['standard_repository']} to #{home}/.dotfiles " do
#      level :info
#    end
#    
#    git "#{home}/.dotfiles" do
#      repository node['dotfiles']['standard_repository']
#      action :sync
#      user login
#      group login
#      only_if {File.directory?(home)}
#    end
    
#    node['dotfiles']['files'].each do |entry|
#      link "#{home}/#{entry}" do
#        owner login
#        group login
#        to "#{home}/.dotfiles/#{entry}"
#        only_if {File.directory?(home)}
#      end
#    end
#    
#    log "[dotfiles] Default dotfiles successfuly exported from #{node['dotfiles']['standard_repository']}" do
#      level :info
#    end
#  end
#  
#  # Or/and uploading custom dotfiles from private repository
#  if admin['dotfiles']['enabled_custom']  
#    
#    log "[dotfiles] Uploading CUSTOM dotfiles for #{admin} from #{admin['dotfiles']['custom_dotfiles_repo']} to #{home}/.custom_dotfiles " do
#      level :info
#    end
#    
#    git "#{home}/.custom_dotfiles" do
#      repository admin['dotfiles']['custom_dotfiles_repo']
#      user login
#      group login
#      action :sync
#      not_if { admin['dotfiles']['custom_dotfiles_repo'].nil? }
#      only_if {File.directory?(home)}
#    end
#    
#    admin['dotfiles']['custom_dotfiles'].each do |entry|
#      link "#{home}/#{entry}" do
#        owner login
#        group login
#        to "#{home}/.custom_dotfiles/#{entry}"
#        only_if {File.directory?(home)}
#      end
#    end
#  end
#end
