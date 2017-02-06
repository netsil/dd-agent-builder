default['omnibus']['build_user'] = 'omnibus'
default['omnibus']['build_user_group'] = 'omnibus_group'
default['omnibus']['build_user_password'] = 'defaultwindowspassword'

default['dd-agent-builder']['install_dir'] = 'C:\opt\datadog-agent'
default['dd-agent-builder']['dd-agent_branch'] = 'master'
default['dd-agent-builder']['dd-agent-omnibus_branch'] = 'master'
default['dd-agent-builder']['omnibus-software_branch'] = 'master'
default['dd-agent-builder']['omnibus-ruby_branch'] = 'master'
default['dd-agent-builder']['dd-integrations-core_branch'] = 'master'

default['dd-agent-builder']['go']['version'] = '1.7.5'
# Values are 386 or amd64
default['dd-agent-builder']['go']['platform'] = 'amd64'
default['dd-agent-builder']['go']['gopath'] = "#{ENV['HOME']}\\go"
