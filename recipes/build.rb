#
# Cookbook Name:: dd-agent-osx-build-box
# Recipe:: build
#
# Copyright 2015, Datadog Inc.
#
# All rights reserved - Do Not Redistribute
#
omnibus_build 'datadog-agent' do
  project_dir "#{build_user_home}\\dd-agent-omnibus"
  log_level :info
  install_dir node['dd-agent-builder']['install_dir']
  environment 'AGENT_BRANCH' => node['dd-agent-builder']['dd-agent_branch'],
              'OMNIBUS_RUBY_BRANCH' => node['dd-agent-builder']['omnibus-ruby_branch'],
              'OMNIBUS_SOFTWARE_BRANCH' => node['dd-agent-builder']['omnibus-software_branch']
  config_overrides 'append_timestamp' => false
end
