default['omnibus']['build_user'] = 'omnibus'
default['omnibus']['build_user_group'] = 'omnibus_group'
raise 'BUILD_USER_PASSWORD not set!' unless ENV['BUILD_USER_PASSWORD']
default['omnibus']['build_user_password'] = "#{ENV['BUILD_USER_PASSWORD']}"

default['dd-agent-builder']['install_dir'] = 'C:\opt\datadog-agent'
default['dd-agent-builder']['dd-agent-omnibus_branch'] = ENV['DD_AGENT_OMNIBUS_BRANCH'] || 'master'
default['dd-agent-builder']['release_version'] = ENV["RELEASE_VERSION"] || "nightly"

default['dd-agent-builder']['go']['version'] = '1.6.4'
# Values are 386 or amd64
default['dd-agent-builder']['go']['platform'] = 'amd64'
default['dd-agent-builder']['go']['gopath'] = "#{ENV['HOME']}\\go"
