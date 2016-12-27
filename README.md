dd-agent-builder cookbook
=========================

Used to build the agent on Windows. Heavily relies on the [Chef Omnibus cookbook](https://github.com/chef-cookbooks/omnibus).

It has two recipes. The default recipes runs prepare then build.

## dd-agent-builder::prepare

Installs Golang and all the dependencies of Omnibus, and downloads `dd-agent-omnibus`.


## dd-agent-builder::build

Builds the agent (with the omnibus_build resource from the omnibus cookbook).
