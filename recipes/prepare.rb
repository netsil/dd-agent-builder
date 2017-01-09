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

git "#{build_user_home}\\dd-agent-omnibus" do
  repository 'https://github.com/DataDog/dd-agent-omnibus'
  revision node['dd-agent-builder']['dd-agent-omnibus_branch']
  action :sync
end

git "#{build_user_home}\\integrations-core" do
  repository 'https://github.com/DataDog/integrations-core'
  revision default['dd-agent-builder']['dd-integrations-core_branch']
  action :sync
end

directory node['dd-agent-builder']['install_dir'] do
  action :create
  recursive true
  owner node['omnibus']['build_user']
end
