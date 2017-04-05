#!/bin/sh

# Create etcd conf dir
mkdir -p /etc/etcd && touch /etc/etcd/etcd.conf

# put a script to run etcdctl from container in /usr/local/bin

echo "runc exec -- etcd /usr/bin/etcdctl @" > /usr/local/bin/etcdctl
chmod +x /usr/local/bin/etcdctl

# Install systemd unit file for running container
sed -e "s/TEMPLATE/${NAME}/g" /etc/systemd/system/etcd_container_template.service > ${HOST}/etc/systemd/system/etcd_container_${NAME}.service

# restore selinux context
chroot ${HOST} /usr/sbin/restorecon -v /etc/systemd/system/etcd_container_${NAME}.service

# Enable systemd unit file
chroot ${HOST} /usr/bin/systemctl enable etcd_container_${NAME}.service
