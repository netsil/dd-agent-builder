#
# Cookbook Name:: dd-agent-osx-build-box
# Recipe:: build
#
# Copyright 2015, Datadog Inc.
#
# All rights reserved - Do Not Redistribute
#

# required by the omnibus_build resource
include_recipe 'chef-sugar::default'

dd_agent_omnibus_dir = "#{build_user_home}/dd-agent-omnibus"
# let's clean bundle state
# first Gemfile.lock
file "#{dd_agent_omnibus_dir}/Gemfile.lock" do
  action :delete
end

# then .bundle directory
directory "#{dd_agent_omnibus_dir}/.bundle" do
  action :delete
  recursive true
end

# delete Gohai cache (otherwise build fails)
# DELETE ME WHEN CENTOS 5 IS EOL
directory 'C:\omnibus-ruby\cache\src' do
  action :delete
  recursive true
end

# Sync the repositories
git dd_agent_omnibus_dir do
  repository 'https://github.com/DataDog/dd-agent-omnibus'
  revision node['dd-agent-builder']['dd-agent-omnibus_branch']
  action :sync
end

ruby_block 'set env variables from release.json and attributes.json' do
  block do
    require 'json'

    file = File.read(File.join(dd_agent_omnibus_dir, "release.json"))
    releases = JSON.parse(file)

    release_version = node['dd-agent-builder']['release_version']
    Chef::Log.info("Using release_version: #{release_version}")
    if not releases.key?(release_version)
      raise "Error: could not find release #{release_version}"
    end

    # supported variables
    vars = {'dd-agent_branch'      => 'AGENT_BRANCH',
      'agent_version'              => 'AGENT_VERSION',
      'agent6_branch'              => 'AGENT6_BRANCH',
      'integrations-core_branch'   => 'INTEGRATIONS_CORE_BRANCH',
      'trace-agent_branch'         => 'TRACE_AGENT_BRANCH',
      'trace_agent_add_build_vars' => 'TRACE_AGENT_ADD_BUILD_VARS',
      'process_agent_branch'       => 'PROCESS_AGENT_BRANCH',
      'omnibus-ruby_branch'        => 'OMNIBUS_RUBY_BRANCH',
      'omnibus-software_branch'    => 'OMNIBUS_SOFTWARE_BRANCH',
    }

    # We first fetch variables from the release.json from dd-agent-omnibus
    vars.values().each do |v|
      if not releases[release_version].key?(v)
        raise "Error: missing '#{v}' variable from release.json (version #{release_version})"
      end
      Chef::Log.info("exporting from release.json: #{v}=#{releases[release_version][v]}")
      ENV[v] = releases[release_version][v]
    end

    # We then allow overritte from local attributes.json (useful for development build)
    vars.each() do |k, v|
      if node['dd-agent-builder'].key?(k)
        Chef::Log.info("overwrite from attributes.json: #{v}=#{node['dd-agent-builder'][k]}")
        ENV[v] = node['dd-agent-builder'][k]
      end
    end

    Chef::Log.info("Final values:")
    vars.values().each do |v|
      Chef::Log.info("  #{v}=#{ENV[v]}")
    end

  end
end

omnibus_build 'datadog-agent' do
  project_dir dd_agent_omnibus_dir
  log_level :info
  live_stream true
  install_dir node['dd-agent-builder']['install_dir']
  config_overrides 'append_timestamp' => false
end
