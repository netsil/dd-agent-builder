@echo off
REM
REM batch file to set up integration sdk builds
REM

call c:\omnibus\load-omnibus-toolchain.bat
cd \
@echo off

REM checks out MASTER of dd-agent-omnibus
@echo git cloning dd-agent-omnibus
call git clone https://github.com/DataDog/dd-agent-omnibus.git

set INTEGRATIONS_REPO=integrations-core
set OMNIBUS_RUBY_BRANCH=datadog-5.5.0
cd \dd-agent-omnibus
@echo bundle update
call bundle update
@echo bundle install
call bundle install

@echo .
@echo INTEGRATIONS_REPO: %INTEGRATIONS_REPO%
@echo OMNIBUS_RUBY_BRANCH: %OMNIBUS_RUBY_BRANCH%
@echo INTEGRATION: %INTEGRATION%
@echo .
@echo type rake agent:build-integration to start build