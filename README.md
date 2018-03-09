dd-agent-builder cookbook
=========================

Used to build the agent on Windows. Heavily relies on the [Chef Omnibus cookbook](https://github.com/chef-cookbooks/omnibus).

It has two recipes. The default recipes runs prepare then build.

## dd-agent-builder::prepare

Installs Golang and all the dependencies of Omnibus, and downloads `dd-agent-omnibus`.


## dd-agent-builder::build

Builds the agent (with the omnibus_build resource from the omnibus cookbook).


Setting custom parameters
=========================

Variables to build an agent are pulled from [release.json from
dd-agent-omnibus](https://github.com/DataDog/dd-agent-omnibus/blob/master/release.json).
Those variables are used to pin version of the agent dependencies.

By default the job will use dd-agent-omnibus's `master` and `nightly` from `release.json`.

## Pulling a specific version of dd-agent-omnibus

You can choose a specific branch, tag or commit by setting the environment
variable `DD_AGENT_OMNIBUS_BRANCH`.

## Building a specific version of the agent

Instead of building `nightly` you can choose a version from
[release.json](https://github.com/DataDog/dd-agent-omnibus/blob/master/release.json)
by setting the environment variable `RELEASE_VERSION`.

## Local overwrite

You can overwrite the following variables by setting them manually in
`attributes.json` (useful for local dev):

- dd-agent-omnibus_branch    : git version of `dd-agent-omnibus` to use
- dd-agent_branch            : git version of `dd-agent` repo to use
- omnibus-ruby_branch        : git version of `omnibus-ruby` to use (DataDog fork)
- omnibus-software_branch    : git version of `omnibus-software` to use (DataDog fork)
- integrations-core_branch   : git version of `integrations-core` to use
- trace-agent_branch         : git version of `trace-agent` to use
- agent_version              : The agent version targeted
- agent6_branch              : git revision of `datadog-agent` repo to use (for dogstatsd 6)
- trace_agent_add_build_vars :
- process_agent_branch       : The version of the process agent to ship

Variables are first loaded from the release.json and then overwritten by `attributes.json`.

example of attributes.json:

```json
{
  "dd-agent-builder": {
    "dd-agent-omnibus_branch": "master",
    "dd-agent_branch": "5.21.0",
    "omnibus-ruby_branch": "master",
    "omnibus-software_branch": "master",
    "integrations-core_branch": "custom-postgres-branch",
    "trace-agent_branch": "master"
  },
  "omnibus": {
  }
}
```
