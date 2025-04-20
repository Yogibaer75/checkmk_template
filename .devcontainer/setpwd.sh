#!/bin/bash

rm -rfv $OMD_ROOT/local/lib/nagios/plugins
ln -sv $WORKSPACE/nagios_plugins $OMD_ROOT/local/lib/nagios/plugins

rm -rfv $OMD_ROOT/local/tmp
ln -sv $WORKSPACE/temp $OMD_ROOT/local/tmp

source /omd/sites/cmk/.profile && echo 'cmkadmin' | /omd/sites/cmk/bin/cmk-passwd -i cmkadmin
chown cmk:cmk /omd/sites/cmk/etc/htpasswd
