# Cookbook Name:: dd-agent-builder
# Recipe:: golang
#
# Inspired by https://github.com/NOX73/chef-golang

go_filename = "go#{node['dd-agent-builder']['go']['version']}.windows-#{node['dd-agent-builder']['go']['platform']}.msi"
go_url = "http://golang.org/dl/#{go_filename}"

windows_package 'Golang' do
  source go_url
  action :install
end

directory node['dd-agent-builder']['go']['gopath'] do
  action :create
  recursive true
  owner node['omnibus']['build_user']
end

env 'GOPATH' do
  value node['dd-agent-builder']['go']['gopath']
end
