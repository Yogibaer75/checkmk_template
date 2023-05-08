#!/bin/bash

for DIR in 'agents' 'checkman' 'checks' 'doc' 'inventory' 'notifications' 'web'; do
    rm -rfv $OMD_ROOT/local/share/check_mk/$DIR
    ln -sv $WORKSPACE/$DIR $OMD_ROOT/local/share/check_mk/$DIR
done;

rm -rfv $OMD_ROOT/local/lib/check_mk/base/plugins/agent_based
ln -sv $WORKSPACE/agent_based $OMD_ROOT/local/lib/check_mk/base/plugins/agent_based

mkdir -p $OMD_ROOT/local/lib/check_mk/gui/plugins/wato/
mkdir -p $OMD_ROOT/local/lib/check_mk/gui/plugins/wato/check_parameters
ln -sv $WORKSPACE/agent_based_check_parameters $OMD_ROOT/local/lib/check_mk/gui/plugins/wato/check_parameters

rm -rfv $OMD_ROOT/local/lib/check_mk/special_agents
ln -sv $WORKSPACE/agent_based_special $OMD_ROOT/local/lib/check_mk/special_agents

rm -rfv $OMD_ROOT/local/lib/nagios/plugins
ln -sv $WORKSPACE/nagios_plugins $OMD_ROOT/local/lib/nagios/plugins

mkdir -p $OMD_ROOT/local/lib/check_mk/base/cee/plugins
rm -rfv $OMD_ROOT/local/lib/check_mk/base/cee/plugins/bakery
ln -sv $WORKSPACE/bakery $OMD_ROOT/local/lib/check_mk/base/cee/plugins/bakery

rm -rfv $OMD_ROOT/local/tmp
ln -sv $WORKSPACE/temp $OMD_ROOT/local/tmp

source /omd/sites/cmk/.profile && echo 'cmkadmin' | /omd/sites/cmk/bin/cmk-passwd -i cmkadmin
