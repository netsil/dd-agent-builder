REM
REM First set the git username and email, otherwise embedded git pulls
REM will fail
REM

REM add git to path because chef has been added by the installer, but
REM the chef-git isn't in the path, and the git installed by the recipe
REM hasn't been installed yet
set PATH=%PATH%;c:\opscode\chefdk\embedded\git\bin
git config --global user.name "Croissant Builder"
git config --global user.email "croissant@datadoghq.com"

mkdir \src
cd \src
git clone https://github.com/DataDog/dd-agent-builder.git
cd dd-agent-builder
call berks
call berks vendor 
move berks-cookbooks cookbooks
rem do initial setup
call chef-client -j c:\cfg\attributes.json -zo dd-agent-builder::prepare
rem do first time build, which also causes some software to be installed. 
rem greatly reduces time of initial desired build
rem call chef-client -j c:\cfg\attributes.json -zo dd-agent-builder::build
rem do it twice, because there are transient failures in the initial
rem setup/download of some files
rem call chef-client -j c:\cfg\attributes.json -zo dd-agent-builder::build