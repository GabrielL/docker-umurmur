#!/usr/bin/dumb-init /bin/sh
confd -onetime -backend env
exec su-exec nobody $@
