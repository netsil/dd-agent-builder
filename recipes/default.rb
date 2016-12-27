#
# Cookbook Name:: dd-agent-osx-build-box
# Recipe:: default
#
# Copyright 2015, Datadog Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'dd-agent-builder::prepare'
include_recipe 'dd-agent-builder::build'
