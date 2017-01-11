#
# Cookbook Name:: dd-agent-osx-build-box
# Recipe:: prepare
#
# Copyright 2015, Datadog Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'omnibus'
include_recipe 'dd-agent-builder::golang'

directory node['dd-agent-builder']['install_dir'] do
  action :create
  recursive true
  owner node['omnibus']['build_user']
end
