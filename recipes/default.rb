#
# Cookbook Name:: rexdev
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'rexcore'
include_recipe 'chef-dk'

case node[:os]
when 'linux'
  include_recipe 'rexcore::graphical'
  include_recipe 'rexdev::_vagrant'
  include_recipe 'rexcore::docker'
  include_recipe 'rexdev::_hub'
when 'windows'
  include_recipe 'rexdev::_windows'
end

# vi: expandtab ts=2 
