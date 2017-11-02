default['omnibus']['build_user'] = 'omnibus'
default['omnibus']['build_user_group'] = 'omnibus_group'
raise 'BUILD_USER_PASSWORD not set!' unless ENV['BUILD_USER_PASSWORD']
default['omnibus']['build_user_password'] = "#{ENV['BUILD_USER_PASSWORD']}"

default['dd-agent-builder']['install_dir'] = 'C:\opt\datadog-agent'
default['dd-agent-builder']['dd-agent_branch'] = ENV['DD_AGENT_BRANCH'] || 'master'
default['dd-agent-builder']['dd-agent-omnibus_branch'] = ENV['DD_AGENT_OMNIBUS_BRANCH'] || 'master'
default['dd-agent-builder']['omnibus-software_branch'] = ENV['OMNIBUS_SOFTWARE_BRANCH'] || 'master'
default['dd-agent-builder']['omnibus-ruby_branch'] = ENV['OMNIBUS_RUBY_BRANCH'] || 'datadog-5.5.0'
default['dd-agent-builder']['integrations-core_branch'] = ENV['INTEGRATIONS_CORE_BRANCH'] || 'master'
default['dd-agent-builder']['trace-agent_branch'] = ENV['TRACE_AGENT_BRANCH'] || 'master'

default['dd-agent-builder']['jmx-fetch_version'] = ENV['JMX_VERSION'] || '0.14.0'
default['dd-agent-builder']['go']['version'] = '1.6.4'
# Values are 386 or amd64
default['dd-agent-builder']['go']['platform'] = 'amd64'
default['dd-agent-builder']['go']['gopath'] = "#{ENV['HOME']}\\go"
