#!/bin/bash

mkdir -p /data/data
chown -R postgres /data/data
chgrp -R postgres /data/data
chmod 700 /data/data

if [ ! -e /data/data/PG_VERSION ]; then
    su postgres -c "/opt/bin/initdb --encoding=UTF8 /data/data --no-locale"
fi
export ENV_PATH=$PATH
exec su postgres -c "/opt/bin/postgres -D /data/data $@"
