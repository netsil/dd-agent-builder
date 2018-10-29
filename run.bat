call ./set-env.bat
call chef-client -zo dd-agent-builder::prepare
call chef-client -zo dd-agent-builder::build
