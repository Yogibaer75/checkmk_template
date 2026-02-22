#!/bin/bash

source /omd/sites/cmk/.profile && echo 'cmkadmin' | /omd/sites/cmk/bin/cmk-passwd -i cmkadmin
chown cmk:cmk /omd/sites/cmk/etc/htpasswd
