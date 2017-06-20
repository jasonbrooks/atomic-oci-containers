#!/bin/sh

source /etc/etcd/etcd.conf

# Execute the commands passed to this script
exec "$@"
